<html>

    <body>

        <?php

            $con = new mysqli("127.0.0.1","root","","quizbaza");
            $res = $con->query("SELECT * FROM questions");
        
            $rows = $res->fetch_all(MYSQLI_ASSOC);
            echo'<form method="POST" action="wynik.php">';
            for($i=0;$i<count($rows);$i++){

                echo '<b>'.$rows[$i]["content"].'</b>'.'</br>';
                $res2 = $con->query("SELECT * FROM answers where questions_id = ".$rows[$i]['id']);
                $rows2 = $res2->fetch_all(MYSQLI_ASSOC);
                for($j=0;$j<count($rows2);$j++){
                    echo '<input type="checkbox" name="'.$i.'-'.$j.'" value="'.$rows2[$j]["is_right"].'">'.$rows2[$j]["description"].'</br>';
                }
            }
            echo '<input type="submit"/>';
            echo '</form>';
           

                    
        
        ?>

    </body>


</html>
