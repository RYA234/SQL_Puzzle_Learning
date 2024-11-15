-- 55 競走馬の入賞回数　その2　p230
-- IN述語を使って、HorseNamesとRacingResultsの結合を行う
SELECT H1.horse, Count(*)
    FROM HorseNames AS H1, RacingResults AS R1
    WHERE H1.horse IN (R1.win_name,R1.place_name,R1.show_name)
    GROUP BY H1.horse;

-- FROM句でテーブルを結合して　クロス結合を作る
-- 
SELECT H1.horse,R1.win_name,R1.place_name,R1.show_name
    FROM HorseNames AS H1, RacingResults AS R1
    ;
-- 上で作ったクロス結合から　IN述語を使って条件指定する。
-- 　3カラムのうち一つでもhorseと同じ文字が入っている条件をもとめている
SELECT H1.horse,R1.win_name,R1.place_name,R1.show_name
    FROM HorseNames AS H1, RacingResults AS R1
    WHERE H1.horse IN (R1.win_name,R1.place_name,R1.show_name)
    ;

-- GROUP BY で部分集合を作り、Count(*)で部分集合との要素の個数を算出する。
-- 答え
SELECT H1.horse, Count(*)
    FROM HorseNames AS H1, RacingResults AS R1
    WHERE H1.horse IN (R1.win_name,R1.place_name,R1.show_name)
    GROUP BY H1.horse;