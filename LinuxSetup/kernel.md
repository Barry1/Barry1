---
title: Kernel-relevante Einstellungen und Informationen
author: Dr. Bastian Ebeling
date: 30. Dezember 2023
---

## Kernel bauen/compilieren

<https://docs.kernel.org/admin-guide/quickly-build-trimmed-linux.html>

## Boot Parameter

### zswap

Mit dem Boot-Parameter `zswap.enabled=1` wird eine transparenter Kompression des SWAP-Spaces aktiviert.
Weitere Informationen dazu sind unter [dem][MMzswap] und [dem Link][Doc418zswap] zu finden.

### mitigations

Mit dem Boot-Parameter `mitigations=off` werden sicherheitsrelevante Prüfungen deaktiviert, die zu einer Performance-Steigerung führen können.
<https://www.kernel.org/doc/html/latest/admin-guide/kernel-parameters.html#:~:text=mitigations%3D>

[MMzswap]: https://docs.kernel.org/admin-guide/mm/zswap.html "Kernel Admin Guide Memory Management: zswap"
[Doc418zswap]: https://www.kernel.org/doc/html/v4.18/vm/zswap.html "Kernel Doc Virtual Memory: zswap"
