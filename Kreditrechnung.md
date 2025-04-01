---
title: Annuitätendarlehen
date: 1. April 2025
author: Dr. Bastian Ebeling
---

## Symbolik

- Kreditschuld $ K_0 $
- Zinssatz $ p $
- Rate $ r $

## Von Periode zu Periode

$$ K_{n+1} = K_n * \left( 1 + p \right) - r $$

## weitere Schritte

$$
\begin{align*}
K_{n+2} &= K_{n+1} * \left( 1 + p \right) - r \newline
&= \left( K_n * \left( 1 + p \right) - r \right) * \left( 1 + p \right) - r \newline
&= K_n * \left( 1 + p \right)^2 - r * \left( 1 + p \right) - r
\end{align*}
$$

$$
\begin{align*}
K_{n+3}
&= K_{n+1} * \left( 1 + p \right)^2 - r * \left( 1 + p \right) - r \newline
&= \left(K_n * \left( 1 + p \right) - r\right) * \left( 1 + p \right)^2 - r * \left( 1 + p \right) - r \newline
&= K_n * \left( 1 + p \right)^3 - r * \left( 1 + p \right)^2 - r * \left( 1 + p \right) - r \newline
\end{align*}
$$

## Vermutung

$$
\begin{align*}
K_m
&= K_0 * \left(1+p\right)^m-r\sum_{i=0}^{m-1} \left(1+p\right)^i \newline
&= K_0 * \left(1+p\right)^m-r\frac{\left(1+p\right)^{m}-1}{p} \newline
&= \left(K_0-\frac{r}{p}\right) * \left(1+p\right)^m+\frac{r}{p} \newline
\end{align*}
$$

$1+p=q$
$m-1=n$

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
