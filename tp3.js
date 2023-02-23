function resultat()
{
    var a = document.getElementById("t1").value;
    var b = document.getElementById("t2").value;
    var c = document.getElementById("t3").value;
    
    var d = document.getElementById("c1").value;
    var e = document.getElementById("c2").value;
    var f = document.getElementById("c3").value;
    

    
    var somme = Number(a)*Number(d) + Number(b)*Number(e) + Number(c)*Number(f);
    var coeff = Number(d) + Number(e) + Number(f);

    var moyenne = somme / coeff;

    m1.value = moyenne;

    if(moyenne<10)
        r1.value = ("Redoublant");
    else if(moyenne<14)
        r1.value = ("Admis passable");
    else 
        r1.value = ("Admis bien");  
}