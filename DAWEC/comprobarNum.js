function comprobarNumero(){
    let numero = Number(prompt("Introduce un número:"))

    if (numero > 0) {
        alert("Es positivo");
    } else if (numero < 0) {
        alert("Es negativo");
    } else{
        alert("Es nulo")
    }
}