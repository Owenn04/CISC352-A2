(define (problem p4-dungeon)
  (:domain Dungeon)

  ; Come up with your own problem instance (see assignment for details)
  ; NOTE: You _may_ use new objects for this problem only.

  ; Naming convention:
  ; - loc-{i}-{j} refers to the location at the i'th column and j'th row (starting in top left corner)
  ; - c{i}{j}{h}{k} refers to the connection connecting loc-{i}-{j} and loc-{h}-{k}
  (:objects
    loc-1-1 loc-2-1 loc-3-1 loc-2-2 loc-3-2 loc-2-3 loc-2-4 loc-1-4 - location
    c1121 c2131 c3132 c3222 c2223 c2324 c2414 c2122 - corridor
    key1 key2 key3 key4 key5 key6 key7 - key
  )

  (:init

    ; Hero location and carrying status
      (hero-at loc-1-1)

    ; Location <> Corridor Connections
      (connection c1121 loc-1-1 loc-2-1)
      (connection c2131 loc-2-1 loc-3-1)
      (connection c3132 loc-3-1 loc-3-2)
      (connection c3222 loc-3-2 loc-2-2)
      (connection c2223 loc-2-2 loc-2-3)
      (connection c2324 loc-2-3 loc-2-4)
      (connection c2414 loc-2-4 loc-1-4)
      (connection c2122 loc-2-1 loc-2-2)

    ; Key locations
      (key-at key1 loc-1-1) ; yellow
      (key-at key2 loc-1-1) ; red
      (key-at key3 loc-1-1) ; rainbow

      (key-at key4 loc-2-3) ; purple
      (key-at key5 loc-2-4) ; yellow
      (key-at key6 loc-3-2) ; purple
      (key-at key7 loc-3-2) ; green

    ; Locked connections
      (locked c1121 yellow)
      (locked c2131 purple)
      (locked c2122 red)
      (locked c3132 yellow)
      (locked c3222 purple)
      (locked c2223 yellow)
      (locked c2324 green)
      (locked c2414 rainbow)

    ; Risky connections
      (is_risky c2122)

    ; Key colours
      (is_red key2)

      (is_yellow key1)
      (is_yellow key5)

      (is_green key7)

      (is_purple key4)
      (is_purple key6)

      (is_rainbow key3)

    ; Key usage properties (one use, two use, etc)
      (has_1_use key3)
      (has_1_use key4)
      (has_1_use key6)
      (has_1_use key7)

      (has_2_uses key1)
      (has_2_uses key5)

      (has_uses key2)
      
  )
  (:goal
    (and
      ; Hero's final location goes here
        (hero-at loc-1-4)
    )
  )

)
