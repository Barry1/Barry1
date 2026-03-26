import io
import zipfile
from pathlib import Path

from lxml import etree


def remove_all_excel_protections(xml_file_obj) -> bytes:
    """
    Entfernt alle relevanten Protection-Elemente aus einem XML-File-Objekt:
      - sheetProtection (in Arbeitsblättern)
      - workbookProtection (in workbook.xml)
      - fileSharing (Revisions- / Strukturschutz in workbook.xml)

    Parameter:
        xml_file_obj: geöffnetes File-Objekt (z. B. aus zipfile.open())

    Rückgabe:
        bytes mit dem bereinigten XML
    """
    # Inhalt lesen (funktioniert bei 'r' und 'rb' Modus)
    if isinstance(xml_file_obj, io.TextIOBase):
        content = xml_file_obj.read().encode("utf-8")
    else:
        content = xml_file_obj.read()
        if hasattr(xml_file_obj, "seek"):
            xml_file_obj.seek(0)  # Zurücksetzen für mögliche Wiederverwendung

    # XML parsen
    parser = etree.XMLParser(remove_blank_text=True, remove_comments=False)
    tree = etree.fromstring(content, parser)

    namespaces = {"x": "http://schemas.openxmlformats.org/spreadsheetml/2006/main"}

    protection_tags = ["sheetProtection", "workbookProtection", "fileSharing"]
    removed_count = 0

    for tag in protection_tags:
        # Mit Namespace (Standardfall bei Excel)
        elements = tree.findall(f".//x:{tag}", namespaces)
        for elem in elements:
            parent = elem.getparent()
            if parent is not None:
                parent.remove(elem)
                removed_count += 1

        # Ohne Namespace (Fallback)
        elements = tree.findall(f".//{tag}")
        for elem in elements:
            parent = elem.getparent()
            if parent is not None:
                parent.remove(elem)
                removed_count += 1

    # XML sauber ausgeben
    modified_xml = etree.tostring(
        tree, pretty_print=True, xml_declaration=True, encoding="utf-8"
    )

    if removed_count > 0:
        print(f"✅ {removed_count} Protection-Element(e) entfernt.")
    else:
        print("ℹ️ Keine Protection-Elemente gefunden.")

    return modified_xml


def unlock_excel_completely(input_path: str, output_path: str = None):
    """
    Entfernt ALLE gängigen Schutzebenen aus einer Excel-Datei:
    - Blattschutz (SheetProtection)
    - Arbeitsmappenschutz (WorkbookProtection inkl. Passwort, lockStructure, lockRevision)
    - FileSharing / Revisionsschutz
    """
    if output_path is None:
        p = Path(input_path)
        output_path = str(p.with_name(f"unlocked_{p.name}"))

    with zipfile.ZipFile(input_path, "r") as zin:
        with zipfile.ZipFile(
            output_path, "w", compression=zipfile.ZIP_DEFLATED
        ) as zout:
            for item in zin.infolist():
                with zin.open(item) as file_obj:

                    zout.writestr(
                        zinfo_or_arcname=item,
                        data=(
                            remove_all_excel_protections(file_obj)
                            if (
                                item.filename == "xl/workbook.xml"
                                or (
                                    item.filename.startswith("xl/worksheets/")
                                    and item.filename.endswith(".xml")
                                )
                            )
                            else zin.read(item)
                        ),
                    )

    print(f"🎉 Vollständig entsperrte Datei gespeichert unter:\n   {output_path}")
    return output_path


# ── Beispielaufruf ─────────────────────────────────────
if __name__ == "__main__":
    unlock_excel_completely("geschuetzte_datei.xlsx")
    # Mit eigenem Ausgabepfad:
    # unlock_excel_completely("input.xlsx", "meine_vollstaendig_entsperrte_datei.xlsx")
