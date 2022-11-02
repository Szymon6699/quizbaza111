<html>

    <body>

        <?php

            #print_r($_POST);
            $wynik = 0;
            

            foreach($_POST as $key =>$value){
                #echo "$key - $value <br>";
                $wynik = $wynik + $value;
            }
            echo "ilosc poprawnych odpowiedzi to: $wynik";

        ?>

    </body>



</html>
