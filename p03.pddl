(define (problem p3-dungeon)
  (:domain Dungeon)

  ; Naming convention:
  ; - loc-{i}-{j} refers to the location at the i'th column and j'th row (starting in top left corner)
  ; - c{i}{j}{h}{k} refers to the corridor connecting loc-{i}-{j} and loc-{h}-{k}
  (:objects
    loc-3-4 loc-4-5 loc-1-2 loc-2-2 loc-3-2 loc-3-3 loc-2-5 loc-1-3 loc-2-1 loc-1-4 loc-3-5 loc-2-4 loc-4-4 loc-2-3 loc-4-3 - location
    c2122 c1222 c2232 c1213 c1223 c2223 c3223 c3233 c1323 c2333 c1314 c2314 c2324 c2334 c3334 c1424 c2434 c2425 c2535 c3545 c4544 c4443 - corridor
    key1 key2 key3 key4 key5 key6 - key
  )

  (:init

    ; Hero location and carrying status
    (hero-at loc-2-1)
    (hand_free)

    ; Location <> Corridor Connections
      ;row 2
    (connection c1222 loc-1-2 loc-2-2)
    (connection c1222 loc-2-2 loc-1-2)
    (loc_cor loc-1-2 c1222)
    (loc_cor loc-2-2 c1222)

    (connection c2232 loc-2-2 loc-3-2)
    (connection c2232 loc-3-2 loc-2-2)
    (loc_cor loc-2-2 c2232)
    (loc_cor loc-3-2 c2232)

      ;row 3
    (connection c1323 loc-1-3 loc-2-3)
    (connection c1323 loc-2-3 loc-1-3)
    (loc_cor loc-1-3 c1323)
    (loc_cor loc-2-3 c1323)

    (connection c2333 loc-2-3 loc-3-3)
    (connection c2333 loc-3-3 loc-2-3)
    (loc_cor loc-2-3 c2333)
    (loc_cor loc-3-3 c2333)

      ;row 4
    (connection c1424 loc-1-4 loc-2-4)
    (connection c1424 loc-2-4 loc-1-4)
    (loc_cor loc-1-4 c1424)
    (loc_cor loc-2-4 c1424)
    (connection c2434 loc-2-4 loc-3-4)
    (connection c2434 loc-3-4 loc-2-4)
    (loc_cor loc-2-4 c2434)
    (loc_cor loc-3-4 c2434)

      ;row 5
    (connection c2535 loc-2-5 loc-3-5)
    (connection c2535 loc-3-5 loc-2-5)
    (loc_cor loc-2-5 c2535)
    (loc_cor loc-3-5 c2535)
    (connection c3545 loc-3-5 loc-4-5)
    (connection c3545 loc-4-5 loc-3-5)
    (loc_cor loc-3-5 c3545)
    (loc_cor loc-4-5 c3545)

      ;col 1
    (connection c1213 loc-1-2 loc-1-3)
    (connection c1213 loc-1-3 loc-1-2)
    (loc_cor loc-1-2 c1213)
    (loc_cor loc-1-3 c1213)
    (connection c1314 loc-1-3 loc-1-4)
    (connection c1314 loc-1-4 loc-1-3)
    (loc_cor loc-1-3 c1314)
    (loc_cor loc-1-4 c1314)

      ;col 2
    (connection c2122 loc-2-1 loc-2-2)
    (connection c2122 loc-2-2 loc-2-1)
    (loc_cor loc-2-1 c2122)
    (loc_cor loc-2-2 c2122)
    (connection c2223 loc-2-2 loc-2-3)
    (connection c2223 loc-2-3 loc-2-2)
    (loc_cor loc-2-2 c2223)
    (loc_cor loc-2-3 c2223)
    (connection c2324 loc-2-3 loc-2-4)
    (connection c2324 loc-2-4 loc-2-3)
    (loc_cor loc-2-3 c2324)
    (loc_cor loc-2-4 c2324)
    (connection c2425 loc-2-4 loc-2-5)
    (connection c2425 loc-2-5 loc-2-4)
    (loc_cor loc-2-4 c2425)
    (loc_cor loc-2-5 c2425)

      ;col 3
    (connection c3233 loc-3-2 loc-3-3)
    (connection c3233 loc-3-3 loc-3-2)
    (loc_cor loc-3-2 c3233)
    (loc_cor loc-3-3 c3233)
    (connection c3334 loc-3-3 loc-3-4)
    (connection c3334 loc-3-4 loc-3-3)
    (loc_cor loc-3-3 c3334)
    (loc_cor loc-3-4 c3334)

      ;col 4
    (connection c4443 loc-4-4 loc-4-3)
    (connection c4443 loc-4-3 loc-4-4)
    (loc_cor loc-4-4 c4443)
    (loc_cor loc-4-3 c4443)
    (connection c4544 loc-4-5 loc-4-4)
    (connection c4544 loc-4-4 loc-4-5)
    (loc_cor loc-4-5 c4544)
    (loc_cor loc-4-4 c4544)

      ;diag
    (connection c1223 loc-1-2 loc-2-3)
    (connection c1223 loc-2-3 loc-1-2)
    (loc_cor loc-1-2 c1223)
    (loc_cor loc-2-3 c1223)
    (connection c3223 loc-3-2 loc-2-3)
    (connection c3223 loc-2-3 loc-3-2)
    (loc_cor loc-3-2 c3223)
    (loc_cor loc-2-3 c3223)
    (connection c2314 loc-2-3 loc-1-4)
    (connection c2314 loc-1-4 loc-2-3)
    (loc_cor loc-2-3 c2314)
    (loc_cor loc-1-4 c2314)
    (connection c2334 loc-2-3 loc-3-4)
    (connection c2334 loc-3-4 loc-2-3)
    (loc_cor loc-2-3 c2334)
    (loc_cor loc-3-4 c2334)
    
    ; Key locations
    (key-at key1 loc-2-1) ;red 
    (key-at key2 loc-2-3) ;green
    (key-at key3 loc-2-3) ;green
    (key-at key4 loc-2-3) ;purple
    (key-at key5 loc-2-3) ;purple
    (key-at key6 loc-4-4) ;rainbow

    ; Locked corridors
    (locked c2425 purple)
    (locked c2535 green)
    (locked c3545 purple)
    (locked c4544 green)
    (locked c4443 rainbow)
    (locked c1223 red)
    (locked c2223 red)
    (locked c3223 red)
    (locked c1323 red)
    (locked c2314 red)
    (locked c2324 red)
    (locked c2334 red)
    (locked c2333 red)
  
    ; Risky corridors
    (is_risky c1223)
    (is_risky c2223)
    (is_risky c3223)
    (is_risky c1323)
    (is_risky c2314)
    (is_risky c2324)
    (is_risky c2334)
    (is_risky c2333)

    ; Key colours
    (key_is key1 red)
    (key_is key2 green)
    (key_is key3 green)
    (key_is key4 purple)
    (key_is key5 purple)
    (key_is key6 rainbow)

    ; Key usage properties (one use, two use, etc)
    (has_uses key1)

    (has_1_use key2)
    (has_uses key2)

    (has_1_use key3)
    (has_uses key3)
    
    (has_1_use key4)
    (has_uses key4)

    (has_1_use key5)
    (has_uses key5)

    (has_1_use key6)
    (has_uses key6)

  )
  (:goal
    (and
      (hero-at loc-4-3)
    )
  )

)
