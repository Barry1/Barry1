#!/usr/bin/env python3
import io
import sys
import types
import zipfile
from pathlib import Path
from typing import IO

from lxml import etree

PROTECTION_TAGS: tuple[str, ...] = (
    "sheetProtection",
    "workbookProtection",
    "fileSharing",
)
SPREADSHEET_NS = types.MappingProxyType(
    {
        "x": "http://schemas.openxmlformats.org/spreadsheetml/2006/main",
    }
)


def _read_xml_bytes(xml_file_obj: IO[bytes]) -> bytes:
    """Read bytes from a file-like object, supporting text and binary modes."""
    if isinstance(xml_file_obj, io.TextIOBase):
        return xml_file_obj.read().encode("utf-8")
    xml_bytes = xml_file_obj.read()
    if hasattr(xml_file_obj, "seek"):
        xml_file_obj.seek(0)
    return xml_bytes


def _remove_protection_elements(
    tree: etree._Element,
    tag_name: str,
) -> int:
    """Remove all elements with the given tag (with and without namespace)."""
    removed = 0
    for element in tree.findall(f".//x:{tag_name}", SPREADSHEET_NS):
        parent = element.getparent()
        if parent is not None:
            parent.remove(element)
            removed += 1
    for element in tree.findall(f".//{tag_name}"):
        parent = element.getparent()
        if parent is not None:
            parent.remove(element)
            removed += 1
    return removed


def remove_all_excel_protections(xml_file_obj: IO[bytes]) -> bytes:
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
    parser = etree.XMLParser(remove_blank_text=True, remove_comments=False)
    tree = etree.fromstring(_read_xml_bytes(xml_file_obj), parser)
    removed_count = sum(
        _remove_protection_elements(tree, tag_name) for tag_name in PROTECTION_TAGS
    )
    if removed_count > 0:
        sys.stdout.write(
            f"✅ {removed_count} Protection-Element(e) entfernt.\n",
        )
    else:
        sys.stdout.write("ℹ️ Keine Protection-Elemente gefunden.\n")
    return etree.tostring(
        tree,
        pretty_print=True,
        xml_declaration=True,
        encoding="utf-8",
    )


def _is_protected_xml(filename: str) -> bool:
    """Return True if the archive member may contain protection elements."""
    if filename == "xl/workbook.xml":
        return True
    return filename.startswith("xl/worksheets/") and filename.endswith(
        ".xml",
    )


def _process_archive_member(
    zin: zipfile.ZipFile,
    zout: zipfile.ZipFile,
    zip_info: zipfile.ZipInfo,
) -> None:
    """Copy one archive member, stripping protections when needed."""
    with zin.open(zip_info) as file_obj:
        if _is_protected_xml(zip_info.filename):
            payload = remove_all_excel_protections(xml_file_obj=file_obj)
        else:
            payload = zin.read(zip_info)
    zout.writestr(zinfo_or_arcname=zip_info, data=payload)


def unlock_excel_completely(
    input_path: str,
    output_path: str | None = None,
) -> str:
    """
    Entfernt ALLE gängigen Schutzebenen aus einer Excel-Datei:
    - Blattschutz (SheetProtection)
    - Arbeitsmappenschutz (WorkbookProtection inkl. Passwort,
      lockStructure, lockRevision)
    - FileSharing / Revisionsschutz
    """
    if output_path is None:
        path_obj = Path(input_path)
        output_path = str(path_obj.with_name(f"unlocked_{path_obj.name}"))

    with zipfile.ZipFile(input_path, "r") as zin:
        with zipfile.ZipFile(
            output_path,
            "w",
            compression=zipfile.ZIP_DEFLATED,
        ) as zout:
            for zip_info in zin.infolist():
                _process_archive_member(zin, zout, zip_info)

    sys.stdout.write(
        f"🎉 Vollständig entsperrte Datei gespeichert unter:\n   {output_path}\n",
    )
    return output_path


if __name__ == "__main__":
    if sys.argv[1:]:
        input_file = sys.argv[1]
        output_file: str | None = sys.argv[2] if len(sys.argv) > 2 else None
        unlock_excel_completely(input_file, output_file)
    else:
        unlock_excel_completely("geschuetzte_datei.xlsx")
