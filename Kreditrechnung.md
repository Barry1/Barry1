---
title: Annuitätendarlehen
date: 1. April 2025
author: Dr. Bastian Ebeling
---

## Symbolik

| Symbol | Nutzung                                   |
| ------ | ----------------------------------------- |
| $K_0$  | Kreditschuld                              |
| $p$    | Zinssatz pro Ratenzahlung                 |
| $r$    | Rate                                      |
| $m$    | Anzahl der Raten                          |
| $h$    | Hilfsgröße $h\coloneqq\left(1+p\right)^m$ |

## Herleitung

### Von Periode zu Periode

$$ K_{n+1} = K_n * \left( 1 + p \right) - r $$

### zur übernächsten Periode

$$
\begin{align*}
K_{n+2} &= K_{n+1} * \left( 1 + p \right) - r \newline
&= \left( K_n * \left( 1 + p \right) - r \right) * \left( 1 + p \right) - r \newline
&= K_n * \left( 1 + p \right)^2 - r * \left( 1 + p \right) - r
\end{align*}
$$

### zur überübernächsten Periode

$$
\begin{align*}
K_{n+3}
&= K_{n+1} * \left( 1 + p \right)^2 - r * \left( 1 + p \right) - r \newline
&= \left(K_n * \left( 1 + p \right) - r\right) * \left( 1 + p \right)^2 - r * \left( 1 + p \right) - r \newline
&= K_n * \left( 1 + p \right)^3 - r * \left( 1 + p \right)^2 - r * \left( 1 + p \right) - r \newline
\end{align*}
$$

### Verallgemeinerung (erkanntes Muster)

$$
\begin{align*}
K_m
&= K_0 * \left(1+p\right)^m-r\sum_{i=0}^{m-1} \left(1+p\right)^i \newline
&= K_0 * \left(1+p\right)^m-r\frac{\left(1+p\right)^{m}-1}{p} \newline
&= \left(K_0-\frac{r}{p}\right) * \left(1+p\right)^m+\frac{r}{p} \newline
\end{align*}
$$

### Versuch

$$
\begin{align*}
K_0 * \left(1+p\right)^{\hat{m}}&=r\sum_{i=0}^{{\hat{m}}-1} \left(1+p\right)^i \newline
\frac{K_0}{r} &=\sum_{i=0}^{{\hat{m}}-1} \left(1+p\right)^{i-\hat{m}} \newline
\frac{K_0}{r} &=\sum_{k=1}^{\hat{m}} \left(1+p\right)^{-k} \newline
\frac{K_0}{r} &=\sum_{k=1}^{\hat{m}} \left(\frac{1}{1+p}\right)^k \newline
1+\frac{K_0}{r} &=\sum_{k=0}^{\hat{m}} \left(\frac{1}{1+p}\right)^k \newline
1+\frac{K_0}{r} &=\frac{\left(\frac{1}{1+p}\right)^{\hat{m}+1}-1}{\left(\frac{1}{1+p}\right)-1} \newline
1+\frac{K_0}{r} &=\frac{\left(\frac{1}{1+p}\right)^{\hat{m}+1}-1}{\frac{-p}{1+p}} \newline
1+\frac{1+p}{-p}\left(1+\frac{K_0}{r}\right) &=\left(\frac{1}{1+p}\right)^{\hat{m}+1} \newline
\end{align*}
$$

$k=\hat{m}-i$ also $i=\hat{m}-k$

$$
\sum_{i=0}^n q^i = \frac{q^{n+1}-1}{q-1}
$$

$$
\left(q-1\right)\sum_{i=0}^n q^i = q^{n+1}-1
$$

## Ergebnis

Mit der Hilfsgröße $h \coloneqq \left(1+p\right)^m$ gilt somit

$$K_m=\left(K_0-\frac{r}{p}\right) h + \frac{r}{p}$$

## Anwendungen

### Wann ist der Kredit getilgt?

Ich suche das $\hat{m}$ für das $K_{\hat{m}} = 0$ wird.

$$
\begin{align*}
K_{\hat{m}} \stackrel{!}{=} 0
&= \left(K_0-\frac{r}{p}\right) * \left(1+p\right)^{\hat{m}}+\frac{r}{p} \newline
-\frac{r}{p}&=\left(K_0-\frac{r}{p}\right) * \left(1+p\right)^{\hat{m}}\newline
-\frac{r}{p}&=\frac{K_0*p-r}{p} * \left(1+p\right)^{\hat{m}}\newline
-\frac{r}{K_0*p-r}&=\left(1+p\right)^{\hat{m}}\newline
\hat{m}&=\log_{1+p}\frac{r}{r-K_0*p} \newline
\hat{m}&=\frac{\ln\left(\frac{r}{r-K_0*p}\right)}{\ln\left(1+p\right)} \newline
\hat{m}&=\frac{\ln \left(r\right) - \ln\left(r-K_0*p\right)}{\ln\left(1+p\right)} \newline
\end{align*}
$$

### Wie viel Kredit kann ich mir leisten?

Wie groß ist $K_0$, dass nach $\hat{m}$ Zahlungen getilgt ist?

$$
\begin{align*}
\frac{r}{r-K_0*p}&=\left(1+p\right)^{\hat{m}}\newline
\frac{r-K_0*p}{r}&=\frac{1}{\left(1+p\right)^{\hat{m}}}\newline
r-K_0*p&=\frac{r}{\left(1+p\right)^{\hat{m}}}\newline
K_0*p&=r-\frac{r}{\left(1+p\right)^{\hat{m}}}\newline
K_0&=\frac{r}{p}\left(1-\frac{1}{\left(1+p\right)^{\hat{m}}}\right)\newline
\end{align*}
$$

### Wie hoch muss die Rate sein?

Mit welcher Rate $\hat{r}$ ist eine Kreditsumme $K_0$ nach $m$ Zahlungen getilgt?

$$
\begin{align*}
\hat{r} &= \frac{K_0 p}{1-\frac{1}{\left(1+p\right)^{\hat{m}}}} \newline
\hat{r} &= \frac{\left(1+p\right)^{\hat{m}}}{\left(1+p\right)^{\hat{m}}-1} K_0 p\newline
\end{align*}
$$

## Formelsammlung

$$
\sum_{i=0}^n 2^i = 2^{i+1}-1
$$

$$
2 \sum_{i=0}^n 3^i = 3^{i+1}-1
$$

$$
\left(q-1\right)\sum_{i=0}^n q^i = q^{n+1}-1
$$

$$
\sum_{i=0}^n q^i = \frac{q^{n+1}-1}{q-1}
$$
