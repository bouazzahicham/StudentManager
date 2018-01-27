/**
 * Created by Hicham on 27/01/2018.
 */



$(document).ready(function(){
    $("#groupetds").change(function(){
        document.getElementById("groupe_tds").submit();
    });
});

$(document).ready(function(){
    $("#seances").change(function(){
        document.getElementById("seance").submit();
    });
});
