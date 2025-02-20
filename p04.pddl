(define (problem p4-dungeon)
  (:domain Dungeon)

  ; Come up with your own problem instance (see assignment for details)
  ; NOTE: You _may_ use new objects for this problem only.

  ; Naming convention:
  ; - loc-{i}-{j} refers to the location at the i'th column and j'th row (starting in top left corner)
  ; - c{i}{j}{h}{k} refers to the connection connecting loc-{i}-{j} and loc-{h}-{k}
  (:objects
    loc-1-1 loc-1-2 loc-1-3 loc-2-2 loc-2-3 loc-3-2 loc-4-2 loc-4-1 - location
    c1112 c1213 c1323 c2322 c2232 c3242 c4241 c1222 - corridor
    key1 key2 key3 key4 key5 key6 key7 - key
  )

  (:init

    ; Hero location and carrying status
      (hero-at loc-1-1)

    ; Location <> Corridor Connections
      (connection c1112 loc-1-1 loc-1-2)
      (connection c1112 loc-1-2 loc-1-1)
      ; location has corridor
      (loc_cor loc-1-1 c1112)
      (loc_cor loc-1-2 c1112)

      (connection c1213 loc-1-2 loc-1-3)
      (connection c1213 loc-1-3 loc-1-2)
      ; location has corridor
      (loc_cor loc-1-3 c1213)
      (loc_cor loc-1-2 c1213)

      (connection c1323 loc-2-3 loc-1-3)
      (connection c1323 loc-1-3 loc-2-3)
      ; location has corridor
      (loc_cor loc-1-3 c1323)
      (loc_cor loc-2-3 c1323)

      (connection c1323 loc-2-3 loc-1-3)
      (connection c1323 loc-1-3 loc-2-3)
      ; location has corridor
      (loc_cor loc-1-3 c1323)
      (loc_cor loc-2-3 c1323)

      (connection c2322 loc-2-3 loc-2-2)
      (connection c2322 loc-2-2 loc-2-3)
      ; location has corridor
      (loc_cor loc-2-2 c2322)
      (loc_cor loc-2-3 c2322)

      (connection c2232 loc-2-2 loc-3-2)
      (connection c2232 loc-3-2 loc-2-2)
      ; location has corridor
      (loc_cor loc-2-2 c2232)
      (loc_cor loc-3-2 c2232)

      (connection c3242 loc-3-2 loc-4-2)
      (connection c3242 loc-4-2 loc-3-2)
      ; location has corridor
      (loc_cor loc-4-2 c3242)
      (loc_cor loc-3-2 c3242)

      (connection c4241 loc-4-2 loc-4-1)
      (connection c4241 loc-4-1 loc-4-2)
      ; location has corridor
      (loc_cor loc-4-2 c4241)
      (loc_cor loc-4-1 c4241)

      (connection c1222 loc-1-2 loc-2-2)
      (connection c1222 loc-2-2 loc-1-2)
      ; location has corridor
      (loc_cor loc-2-2 c1222)
      (loc_cor loc-1-2 c1222)

      
    ; Key locations
      (key-at key1 loc-1-1) ; yellow
      (key-at key2 loc-1-1) ; red
      (key-at key3 loc-1-1) ; rainbow

      (key-at key4 loc-3-2) ; purple
      (key-at key5 loc-4-2) ; yellow
      (key-at key6 loc-2-3) ; purple
      (key-at key7 loc-2-3) ; green

    ; Locked connections
      (locked c1112 yellow)
      (locked c1213 purple)
      (locked c1222 red)
      (locked c1323 yellow)
      (locked c2322 purple)
      (locked c2232 yellow)
      (locked c3242 green)
      (locked c4241 rainbow)

    ; Risky connections
      (is_risky c1222)

    ; Key colours
      (key_is key2 red)
      (key_is key1 yellow)
      (key_is key5 yellow)
      (key_is key7 green)
      (key_is key4 purple)
      (key_is key6 purple)
      (key_is key3 rainbow)

    ; Key usage properties (one use, two use, etc)
      (has_1_use key3)
      (has_uses key3)

      (has_1_use key4)
      (has_uses key4)

      (has_1_use key6)
      (has_uses key6)

      (has_1_use key7)
      (has_uses key7)

      (has_2_uses key1)
      (has_uses key1)

      (has_2_uses key5)
      (has_uses key5)

      (has_uses key2)
      
  )
  (:goal
    (and
      ; Hero's final location goes here
        (hero-at loc-4-1)
    )
  )

)
