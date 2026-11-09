# PRÁCTICA: PÁGINA WEB ACCESIBLE

**COLEGIO CALASANZ DE SALAMANCA | DAW**
Diseño de interfaces web

---

## Índice

- Práctica: Página web accesible
  1. Enunciado
  2. Página HTML/CSS
     - 2.1. Qué tiene que incluir la página (parte 1: 60%)
  3. Informe de auditoría (parte 2 - 40%)
  4. Entregables y formato
  6. Evaluación
     - 6.1. Página (6 pts)
     - 6.2. Informe de auditoría (4 pts)

---

## 1. ENUNCIADO

- La práctica consistirá en construir una página HTML/CSS accesible desde cero con lo visto durante este tema. Además de documentar el proceso de auditoría que demuestra que esa accesibilidad se ha comprobado, no solo intentado.
- Para ello tendrás que entregar tanto la página web, como un documento con la auditoría, cuyo contenido se detalla más adelante.

---

## 2. PÁGINA HTML/CSS

- Para la página web usaréis como punto de partida el diseño de la práctica del tema 1. De las páginas que diseñasteis en Figma, **elegid una sola** (la que consideréis más representativa) y construidla en HTML y CSS real.
- **No tiene que quedar exactamente igual.** El Figma era un diseño visual; ahora estáis construyendo el documento real, y algunas decisiones cambiarán de forma natural al pasar a código. Lo que sí tiene que mantenerse es la esencia: la estructura de contenido, los componentes principales y la línea visual (colores y tipografías de vuestra guía de estilo).
- Esta práctica además de la accesibilidad tiene otro objetivo: que recordéis y practiquéis con HTML/CSS. Durante el resto del módulo las prácticas y el contenido que veremos será usando HTML/CSS. Es por ello que en esta práctica lo mejor es que uséis el CSS y HTML que ya conocéis para conseguir la maquetación. Lo que aquí se evalúa es la accesibilidad, no la sofisticación del layout.

### 2.1. Qué tiene que incluir la página (parte 1: 60%)

- Como mínimo, vuestra página debe demostrar:
  - **HTML semántico completo:** `<header>`, `<nav>`, `<main>`, `<footer>`, y `<section>` / `<article>` donde corresponda según el contenido. Nada de "div soup".
  - **Jerarquía de encabezados correcta:** un único `<h1>`, sin saltos de nivel.
  - **Imágenes con `alt` apropiado:** descriptivo si aporta información, vacío (`alt=""`) si es decorativa.
  - **Formularios accesibles**, si vuestra página incluye alguno (`<label for>` asociado a cada campo, agrupación con `<fieldset>` / `<legend>` si aplica).
  - **Contraste de color suficiente** en todos los textos, siguiendo vuestra guía de estilo o ajustándola si hace falta.
  - **ARIA solo donde corresponda:** (si es que es necesario)
  - **Navegación por teclado funcional:**
  - `lang="es"` en la etiqueta `<html>`.

---

## 3. INFORME DE AUDITORÍA (PARTE 2 - 40%)

- Además del código, debéis entregar un documento PDF que documenta el proceso de verificación. Debe incluir:
  1. **Resultados de las dos herramientas** vistas (WAVE + Lighthouse; Axe DevTools es un plus). Capturas de pantalla.
  2. **Problemas encontrados y corregidos**, podéis usar este formato de tabla:

     | PROBLEMA ENCONTRADO | HERRAMIENTA QUE LO DETECTÓ | CRITERIO WCAG RELACIONADO | CÓMO SE CORRIGIÓ |
     |---|---|---|---|
     | *(ejemplo)* Imagen del logo sin `alt` | WAVE | 1.1.1 Contenido no textual | Se añadió `alt="Logo de [nombre del servicio]"` |

  3. **Puntuación final de Lighthouse en Accesibilidad**, con captura. **Objetivo: ≥ 90.**
  4. **Verificación por teclado documentada**: una breve confirmación de que habéis probado la página solo con teclado (`Tab`, `Enter`, `Esc`) y qué habéis comprobado (foco visible, orden lógico, skip link funcional).
- El informe no tiene que ser largo ni elaborado en diseño, lo que se valora es que sea **honesto y completo**: que refleje problemas reales que encontrasteis y cómo los resolvisteis, no una lista perfecta desde el primer intento. De hecho, un informe que muestre 2-3 errores reales detectados y corregidos demuestra mejor el proceso que uno que diga "no se ha encontrado ningún problema".

---

## 4. ENTREGABLES Y FORMATO

- Carpeta o repositorio con: `index.html`, `estilos.css`, y las imágenes/recursos usados.
- Informe de auditoría en PDF como archivo aparte.

---

## 6. EVALUACIÓN

- Práctica relacionada con los resultados de aprendizaje: **RA5** (65%)
- **Plagio**: El plagio supondrá un cero tanto al plagiador como al plagiado. Se considerará plagio el hecho de que el 25% o más de la práctica sea idéntica. (Idea, diseño, justificaciones, etc.)
- **Penalización por faltas de ortografía**: -0.25 por falta (máximo -2 en la nota final)
- Rúbrica de evaluación:

### 6.1. Página (6 pts)

| CRITERIO | INSUFICIENTE | ADECUADO | EXCELENTE |
|---|---|---|---|
| **HTML semántico** (máx. 1,5) | *(0 pts)* Estructura basada en `<div>` / `<span>` sin etiquetas semánticas ("div soup"), o etiquetas semánticas mal aplicadas (p. ej. varios `<main>`) | *(0,75 pts)* Usa las etiquetas principales (`header`, `nav`, `main`, `footer`) pero con algún uso incorrecto o inconsistente de `section` / `article` | *(1,5 pts)* Estructura semántica completa y coherente con el contenido real de la página |
| **Jerarquía de encabezados** (máx. 0,5) | *(0 pts)* Sin `<h1>`, con varios `<h1>`, o con saltos de nivel evidentes | *(0,25 pts)* Un único `<h1>` correcto, pero algún salto puntual en niveles inferiores | *(0,5 pts)* Jerarquía completa y lógica, sin saltos, en toda la página |
| **Imágenes con `alt`** (máx. 0,5) | *(0 pts)* Imágenes sin `alt`, o `alt` genérico tipo "imagen1.jpg" | *(0,25 pts)* La mayoría de imágenes con `alt` correcto, pero alguna decorativa sin `alt=""` o alguna informativa poco descriptiva | *(0,5 pts)* Todas las imágenes con `alt` adecuado: descriptivo si aporta información, vacío si es decorativa |
| **Formularios accesibles** (máx. 0,5) | *(0 pts)* Campos sin `label`, o solo con `placeholder` | *(0,25 pts)* La mayoría de campos con `label` asociado, pero falta agrupación (`fieldset`) donde tendría sentido | *(0,5 pts)* Todos los campos con `label` correctamente asociado (`for` / `id`) y agrupación adecuada. (En caso de no haber formularios, se dará como correcta) |
| **Contraste de color** (máx. 0,5) | *(0 pts)* Varios textos por debajo del mínimo WCAG (4.5:1 / 3:1) | *(0,25 pts)* Algún texto puntual (p. ej. un texto secundario o placeholder) por debajo del mínimo | *(0,5 pts)* Todo el texto cumple el contraste mínimo AA |
| **Uso de ARIA** (máx. 0,5) | *(0 pts)* ARIA ausente donde era necesario, o usado de forma redundante/incorrecta sobre etiquetas nativas | *(0,25 pts)* ARIA aplicado correctamente en la mayoría de casos, con algún uso innecesario o algún atributo mal aplicado | *(0,5 pts)* ARIA usado solo donde corresponde, sin redundancias, y bien aplicado en todos los componentes interactivos propios. (Si aplica) |
| **Navegación por teclado** (máx. 1) | *(0 pts)* Hay controles inalcanzables por teclado, foco invisible en algún punto, o no hay skip link | *(0,5 pts)* Todo es alcanzable y el foco es visible, pero el skip link falta o el orden de tabulación no es del todo lógico | *(1 pt)* Skip link funcional, foco visible en todo momento, orden de tabulación lógico y ningún control inalcanzable |
| **Fidelidad a la guía de diseño de Figma** (máx. 1) | *(0 pts)* Poca relación reconocible con el diseño original (estructura o línea visual distintas) | *(0,5 pts)* Se reconoce el diseño original en estructura o en línea visual, pero no en ambas | *(1 pt)* Estructura de contenido y línea visual (colores/tipografías de la guía de estilo) claramente reconocibles del diseño original |

### 6.2. Informe de auditoría (4 pts)

| CRITERIO | INSUFICIENTE | ADECUADO | EXCELENTE |
|---|---|---|---|
| **Herramientas usadas** (máx. 1) | *(0 pts)* Solo una herramienta, o resultados sin capturas/evidencia | *(0,5 pts)* Dos herramientas usadas (WAVE + Lighthouse), con evidencia, pero incompleta o poco clara | *(1 pt)* Dos herramientas con resultados claros y completos (WAVE + Lighthouse; Axe como plus) |
| **Tabla de problemas** (máx. 1) | *(0 pts)* Tabla ausente o incompleta (faltan columnas clave como el criterio WCAG) | *(0,5 pts)* Tabla presente con la mayoría de columnas, pero algún problema descrito de forma vaga o sin criterio WCAG asociado | *(1 pt)* Tabla completa: problema, herramienta, criterio WCAG y corrección aplicada, todos bien identificados |
| **Evidencia de corrección** (máx. 1) | *(0 pts)* No se muestra ningún ciclo real de detectar y corregir (o el informe afirma "no se encontró ningún problema", lo cual se revisará como sospechoso) | *(0,5 pts)* Se documenta al menos un problema real corregido, pero sin mostrar claramente el antes/después | *(1 pt)* Se documentan varios problemas reales, con evidencia clara del estado antes y después de la corrección |
| **Puntuación y verificación teclado** (máx. 1) | *(0 pts)* Sin puntuación de Lighthouse documentada, o sin mención a la verificación por teclado | *(0,5 pts)* Puntuación de Lighthouse documentada pero por debajo de 90, o verificación por teclado mencionada sin detalle | *(1 pt)* Puntuación de Lighthouse ≥ 90 documentada con captura, y verificación por teclado descrita con detalle (qué se probó y qué se confirmó) |
