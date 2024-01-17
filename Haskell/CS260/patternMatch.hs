checkCharBad::Char -> String
checkCharBad x = if x == 'a' then "the Char is a" else (if x == 'z' then "the Char is z" else "the Char is not a or z")

checkCharGood1::Char -> String
checkCharGood1 x | x == 'a' = "the Char is a"
                 | x == 'z' = "the Char is z"
                 | otherwise = "the Char is not a or z"

checkCharGood2::Char -> String
checkCharGood2 'a' = "the Char is a"
checkCharGood2 'z' = "the Char is z"
checkCharGood2 _ = "the Char is not a or z"