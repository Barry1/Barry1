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
K_m = K_0 * \left(1+p\right)^m-r\sum_{i=0}^{m-1} \left(1+p\right)^i
$$
