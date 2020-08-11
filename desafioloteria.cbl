      $set sourceformat"free"
      *>Divisão de identificação do programa
       identification division.
       program-id. "desafioloteria".
       author. "Thays Popper".
       installation. "PC".
       date-written. 31/07/2020.
       date-compiled. 31/07/2020.



      *>Divisão para configuração do ambiente
       environment Division.
       configuration Section.
           special-names. decimal-point is comma.

      *>-----Declaração dos recursos externos
       input-output Section.
       file-control.
       i-O-control.

      *>Declaração de variáveis
       data division.


      *>----Variaveis de arquivos
       File Section.


      *>----Variaveis de trabalho
       working-storage section.

      *>==================================
      *> Declaração Variáveis de Trabalho
      *>==================================

       01 ws-sorteio.
           05 ws-semente                          pic 9(08).
           05 ws-semente1                         pic 9(08).
           05 ws-num-random                       pic 9(01)v9999.
           05 ws-num-sorteio                      pic 9(02).
           05 ws-num1-sort1                       pic 9(02).
           05 ws-num2-sort2                       pic 9(02).
           05 ws-num3-sort3                       pic 9(02).
           05 ws-num4-sort4                       pic 9(02).
           05 ws-num5-sort5                       pic 9(02).
           05 ws-num6-sort6                       pic 9(02).

       01 ws-relogio.
           05 ws-hora                             pic 9(02).
           05 ws-minuto                           pic 9(02).
           05 ws-segundo                          pic 9(02).
           05 ws-cent-segundo                     pic 9(02).

       01 ws-numeros.
           05 ws-num1                              pic 9(02) value 1.
           05 ws-num2                              pic 9(02) value 1.
           05 ws-num3                              pic 9(02) value 1.
           05 ws-num4                              pic 9(02) value 1.
           05 ws-num5                              pic 9(02) value 1.
           05 ws-num6                              pic 9(02) value 1.
           05 ws-num7                              pic 9(02) value 1.
           05 ws-num8                              pic 9(02) value 1.
           05 ws-num9                              pic 9(02) value 1.
           05 ws-num10                             pic 9(02) value 1.


       77 ws-ind                                  pic 9(01).
       77 ws-num-aposta                           pic 9(02).
       77 ws-tentativa                            pic 9(02).
       77 ws-controle                             pic 9(02).
       77 ws-contador                             pic 9(09).


       01 ws-hora-inicio.
           05 ws-hor                               pic 9(02).
           05 ws-min                               pic 9(02).
           05 ws-seg                               pic 9(02).

       01 ws-hora-final.
           05 ws-hor-fim                           pic 9(02).
           05 ws-min-fim                           pic 9(02).
           05 ws-seg-fim                           pic 9(02).



       77 ws-dif-hr                                pic 9(02).
       77 ws-dif-min                               pic 9(02).
       77 ws-dif-seg                               pic 9(02).

      *>----Variaveis para comunicação entre programas
       linkage section.


      *>----Declaração de tela
       screen section.





      *>Declaração do corpo do programa
       procedure Division.

           perform 1000-inicializa.
           perform 2000-processamento.
           perform 3000-finaliza.

      *>------------------------------------------------------------------------
      *>                   Procedimentos de Inicialização
      *>------------------------------------------------------------------------
       1000-inicializa section.


           move 0 to ws-contador
           move 0 to ws-ind

           .
       1000-inicializa-exit.
           exit.

      *>------------------------------------------------------------------------
      *>                        Processamento Principal
      *>------------------------------------------------------------------------
       2000-processamento section.

      *>============================================
      *> Processamento Principal, Tela para Jogador
      *>============================================
           move function current-date(9:6) to ws-hora-inicio


           display "====================== Mega - Sena ======================"
           display "===                                                   ==="
           display "===            01 02 03 04 05 06 07 08 09 10          ==="
           display "===            11 12 13 14 15 16 17 18 19 20          ==="
           display "===            21 22 23 24 25 26 27 28 29 30          ==="
           display "===            31 32 33 34 35 36 37 38 39 40          ==="
           display "===            41 42 43 44 45 46 47 48 49 50          ==="
           display "===            51 52 53 54 55 56 57 58 59 60          ==="
           display "===                                                   ==="
           display "========================================================="

            *> Informando os números para não ter repetição

            display " Informe o primeiro Numero "
            display " Lembrando que eh de 1 - 60"
            accept ws-num1

            display " Informe o Segundo Numero "
            display " Lembrando que eh de 1 - 60"
            accept ws-num2

            display " Informe o Terceiro Numero "
            display " Lembrando que eh de 1 - 60"
            accept ws-num3

            display " Informe o Quarto Numero "
            display " Lembrando que eh de 1 - 60"
            accept ws-num4

            display " Informe o Quinto Numero "
            display " Lembrando que eh de 1 - 60"
            accept ws-num5

            display " Informe o Sexto Numero "
            display " Lembrando que eh de 1 - 60"
            accept ws-num6

            display " Informe o Setimo Numero "
            display " Lembrando que eh de 1 - 60"
            accept ws-num7
            if ws-num7 = 0 then
               move 0                       to ws-num7
               move 0                       to ws-num8
               move 0                       to ws-num9
               move 0                       to ws-num10
               perform 2100-sorteio-mega-sena
            end-if

            display " Informe o Oitavo Numero  "
            display " Lembrando que eh de 1 - 60"
            accept ws-num8
               if ws-num8 = 0 then
                   move 0                       to ws-num8
                   move 0                       to ws-num9
                   move 0                       to ws-num10
                   perform 2100-sorteio-mega-sena
               end-if

            display " Informe o Nono Numero "
            display " Lembrando que eh de 1 - 60"
            accept ws-num9

               if ws-num9 = 0 then
                   move 0                       to ws-num9
                   move 0                       to ws-num10
                   perform 2100-sorteio-mega-sena
               end-if

            display " Informe o Decimo Numero "
            display " Lembrando que eh de 1 - 60"
            accept ws-num10

               if ws-num10 = 0 then
                   move 0                       to ws-num10
                   perform 2100-sorteio-mega-sena
               end-if



           .

       2000-processamento-exit.
           exit.


       2100-sorteio-mega-sena section.

      *>========================
      *> Fazer Sorteio Mega-Sena
      *>=========================
           move 0 to ws-ind
           perform until ws-ind <> 0
           move ws-semente to ws-relogio
           accept ws-semente from time

      *>========= Primeiro Numero =========
           perform 2200-semente-delay
           compute ws-num1-sort1 = function random (ws-semente)
           multiply ws-num1-sort1 by 60 giving ws-num1-sort1


      *>======= Segundo Numero =========
           perform 2200-semente-delay
           compute ws-num2-sort2 = function random (ws-semente + ws-num1-sort1)
           multiply ws-num2-sort2 by 60 giving ws-num2-sort2



      *>======= Terceiro Numero =========
           perform 2200-semente-delay
           compute ws-num3-sort3 = function random (ws-semente + ws-num2-sort2)
           multiply ws-num3-sort3 by 60 giving ws-num3-sort3


      *>======= Quarto Numero =========
           perform 2200-semente-delay
           compute ws-num4-sort4 = function random (ws-semente + ws-num3-sort3)
           multiply ws-num4-sort4 by 60 giving ws-num4-sort4


      *>======= Quinto Numero =========
           perform 2200-semente-delay
           compute ws-num5-sort5 = function random (ws-semente + ws-num4-sort4)
           multiply ws-num5-sort5 by 60 giving ws-num5-sort5



      *>======= Sexto Numero =========
           perform 2200-semente-delay
           compute ws-num6-sort6 = function random (ws-semente + ws-num5-sort5)
           multiply ws-num6-sort6 by 60 giving ws-num6-sort6

           perform 2300-conferir

          end-perform



           .

       2100-sorteio-mega-sena-exit.
           exit.

      *>==================================
      *> Delay de 1 Centessimo de Segundo
      *>==================================

       2200-semente-delay section.

           perform 10 times
               accept ws-semente1 from time
               move ws-semente1 to ws-semente
               perform until ws-semente > ws-semente1
                   accept ws-semente from time

               end-perform
           end-perform
           .
       2200-semente-delay-exit.
           exit.


       2300-conferir section.

           if   ws-num1-sort1 <> ws-num2-sort2
           and  ws-num1-sort1 <> ws-num3-sort3
           and  ws-num1-sort1 <> ws-num4-sort4
           and  ws-num1-sort1 <> ws-num5-sort5
           and  ws-num1-sort1 <> ws-num6-sort6
           and ws-num1-sort1 <> "0" then

               if   ws-num2-sort2 <> ws-num3-sort3
               and  ws-num2-sort2 <> ws-num4-sort4
               and  ws-num2-sort2 <> ws-num5-sort5
               and  ws-num2-sort2 <> ws-num6-sort6
               and  ws-num2-sort2 <> "0" then

                   if  ws-num3-sort3 <> ws-num4-sort4
                   and ws-num3-sort3 <> ws-num5-sort5
                   and ws-num3-sort3 <> ws-num6-sort6
                   and ws-num3-sort3 <> "0" then
                       if   ws-num4-sort4  <> ws-num5-sort5
                       and  ws-num4-sort4  <> ws-num6-sort6
                       and  ws-num4-sort4  <> "0" then
                           if  ws-num5-sort5 <> ws-num6-sort6
                           and ws-num5-sort5 <> "0" then

                               perform 2400-comparar-aposta
                               display  ws-num1-sort1 " - " ws-num2-sort2
                                        " - " ws-num3-sort3 " - " ws-num4-sort4
                                        " - " ws-num5-sort5 " - " ws-num6-sort6
                                        " - " ws-contador

                           else
                               perform 2100-sorteio-mega-sena

                           end-if

                       end-if
                   end-if
               end-if
           end-if
           .

       2300-conferir-exit.
           exit.

       2400-comparar-aposta section.

      *>=================
      *> Testando Aposta
      *>=================
           add 1 to ws-contador

           if ws-num1-sort1 =  ws-num1 or ws-num1-sort1 = ws-num2
           or ws-num1-sort1 =  ws-num3 or ws-num1-sort1 = ws-num4
           or ws-num1-sort1 =  ws-num5 or ws-num1-sort1 = ws-num6
           or ws-num1-sort1 =  ws-num7 or ws-num1-sort1 = ws-num8
           or ws-num1-sort1 =  ws-num9 or ws-num1-sort1 = ws-num10 then
               if ws-num2-sort2 =  ws-num1 or ws-num2-sort2 = ws-num2
               or ws-num2-sort2 =  ws-num3 or ws-num2-sort2 = ws-num4
               or ws-num2-sort2 =  ws-num5 or ws-num2-sort2 = ws-num6
               or ws-num2-sort2 =  ws-num7 or ws-num2-sort2 = ws-num8
               or ws-num2-sort2 =  ws-num9 or ws-num2-sort2 = ws-num10 then

                   if ws-num3-sort3 =  ws-num1 or ws-num3-sort3 = ws-num2
                   or ws-num3-sort3 =  ws-num3 or ws-num3-sort3 = ws-num4
                   or ws-num3-sort3 =  ws-num5 or ws-num3-sort3 = ws-num6
                   or ws-num3-sort3 =  ws-num7 or ws-num3-sort3 = ws-num8
                   or ws-num3-sort3 =  ws-num9 or ws-num3-sort3 = ws-num10 then

                       if ws-num4-sort4 =  ws-num1 or ws-num4-sort4 = ws-num2
                       or ws-num4-sort4 =  ws-num3 or ws-num4-sort4 = ws-num4
                       or ws-num4-sort4 =  ws-num5 or ws-num4-sort4 = ws-num6
                       or ws-num4-sort4 =  ws-num7 or ws-num4-sort4 = ws-num8
                       or ws-num4-sort4 =  ws-num9 or ws-num4-sort4 = ws-num10 then

                           if ws-num5-sort5 =  ws-num1 or ws-num5-sort5 = ws-num2
                           or ws-num5-sort5 =  ws-num3 or ws-num5-sort5 = ws-num4
                           or ws-num5-sort5 =  ws-num5 or ws-num5-sort5 = ws-num6
                           or ws-num5-sort5 =  ws-num7 or ws-num5-sort5 = ws-num8
                           or ws-num5-sort5 =  ws-num9 or ws-num5-sort5 = ws-num10 then

                               if ws-num6-sort6 =  ws-num1 or ws-num6-sort6 = ws-num2
                               or ws-num6-sort6 =  ws-num3 or ws-num6-sort6 = ws-num4
                               or ws-num6-sort6 =  ws-num5 or ws-num6-sort6 = ws-num6
                               or ws-num6-sort6 =  ws-num7 or ws-num6-sort6 = ws-num8
                               or ws-num6-sort6 =  ws-num9 or ws-num6-sort6 = ws-num10 then
                                   display "======== Parabens ====== "
                                   display "======== Voce Esta Rico ======= "

                                   display ws-num1 " - " ws-num2 " - " ws-num3
                                           ws-num4 " - " ws-num5 " - " ws-num6

                                   display ws-num1-sort1 " - " ws-num2-sort2 " - " ws-num3-sort3
                                           ws-num4-sort4 " - " ws-num5-sort5 " - " ws-num6-sort6
                                   display " Quantidade de Sorteios " ws-contador


                                   else
                                       perform 2100-sorteio-mega-sena
                               end-if
                           end-if
                       end-if
                   end-if
               end-if
           end-if
      *>===============================
      *> Tempo utilizado para acertar
      *>===============================
               perform 2500-temp-utilizado
               display "Voce levou "ws-dif-hr" hrs, "
               display ws-dif-min" min e "
               display ws-dif-seg" seg para acertar."

      *>=============================================
      *> Quantidade de vezes de apostas até acertar
      *>============================================

               display "                          "
               display "Voce Apostou: " ws-contador " Vezes Ate Acertar"


           .

       2400-comparar-aposta-exit.
           exit.

      *>----------------------calculo do tempo gasto no jogo--------------------------------

       2500-temp-utilizado section.

           compute ws-dif-hr  = (ws-hor - ws-hor-fim)
           compute ws-dif-min = (ws-min - ws-min-fim)
           compute ws-dif-seg = (ws-seg - ws-seg-fim)

           .
       2500-temp-utilizado-exit.
           exit.



      *>------------------------------------------------------------------------
      *>                       Finalização
      *>------------------------------------------------------------------------
       3000-finaliza section.

           stop run
           .
       3000-finaliza-exit.
           exit.












