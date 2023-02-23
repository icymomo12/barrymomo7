function affichagetab()
{
    document.write('<table border=2px width=30%');
    for(let i = 0 ; i <= 10; i++)
    {
        document.write('<tr><td>*</td><td>*</td><td>*</td></td>');
    }
    document.write('</table>');
}
function affichagetab2()
{var count = prompt("Combien de ligne souhaitez vous");
    document.write('<table border=2px width=30%');
    for(let i = 1 ; i <= count; i++)
    {
        document.write('<tr><td>"+i+"</td><td>*</td><td>*</td></td>');
    }
    document.write('</table>');
}
function seconnecter()
{
    var login = prompt("Donner votre nom d'utilisateur");
    var password = prompt("Entrer votre mot de passe");

    if ( login == "admin" && password == "admin"){
        document.write("WOO BACK BABY");
    }
      else  
    alert("mot de passe errone");
}
function seconnecter2()
{
    do {
    var login = prompt("Donner votre nom d'utilisateur");
    var password = prompt("Entrer votre mot de passe");

    if( login == "admin" && password == "admin"){
        document.write("WOO BACK BABY")
        break;
        }
    
      else
    {alert("acces refuse");
    i+=1;}
}
    while(i<3);
    if(i==3) 
    alert("delai depase")   
}
function cdc()
{
    var chaine = prompt("donnez un mot");
    document.write(chaine.toUpperCase()+"<br>");
    document.write(chaine.toLowerCase()+"<br>");
    document.write("a chaine contient " + chaine.length+" caracteres "+"<br>");
    document.write("la premiere lettre est " + chaine.substr(0,2)+" caracteres "+"<br>");  
}
function swich() 
{
var color = prompt ("Entrez une couleur");

switch(color)
{
case "rouge" : document.body.style.background = "red";
break;
case "ROUGE" : document.body.style.background = "red";
break;
case "bleu" : document.body.style.background = "blue";
break;
case "BLEU" : document.body.style.background = "blue";
break;

default:alert("couleur non definie");

}
}