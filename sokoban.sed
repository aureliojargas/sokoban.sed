#!/bin/sed -nf
#r sokoban.sed - aurélio marinho jargas <aurelio@verde666.org>
#r
#r motivated by reading the amazing Adventure (Colossal Cave) history
#r      <http://www.rickadams.org/adventure/a_history.html>
#r GPL levels took from Mike Sharpe's sokoban.vim <http://vim.sourceforge.net>
#r
#r IMPORTANT
#r this script has terminal control chars, so you must DOWNLOAD this
#r file. just copy/paste or printing it to a file (lynx) will NOT work.
#r
#r THE GAME
#r you know sokoban. everybody knows sokoban.
#r right, if you don't, it's a box pushing game. you have a mess, boxes all
#r over the room and must place them on the boxes place. to move a box
#r you must push it. you can only push a box if it's way is clear with
#r no wall or other box on the way (you are not that strong).
#r
#r MOVING AROUND
#r h or <left-arrow>  - move left
#r j or <down-arrow>  - move down
#r k or <up-arrow>    - move up
#r l or <right-arrow> - move right
#r
#r ACTORS
#r % wall
#r o box
#r . box place
#r O box placed right
#r @ you
#r ! you over a box place
#r 
#r COMMANDS
#r :q   quit
#r :r   restart level
#r :z   refresh screen
#r :gN  go to level N
#r
#r RUNNING
#r prompt$ ./sokoban.sed<enter>
#r <enter>
#r 1
#r now just move! (:q quits)
#r
#r DETAILS
#r it's all written in SED, so we've got some limitations:
#r - as a line-oriented editor, you MUST hit <ENTER> after *any* move.
#r   yes, that sucks. but you can accumulate various movements and hit
#r   <ENTER> just once.
#r - when you run sokoban.sed, you must first press any key to feed SED
#r   and then you'll see the welcome message.
#r - the text you type in, is printed directly on the screen, so
#r   there's no way to clear it on this sed script. screen control
#r   chars can do it, but i'm trying to avoid them for now.
#r - these #r comments is because vim syntax doesn't handle sed
#r   comments very well
#r - if your sed is not on /bin, edit the first line of this script
#r - Solaris sed or other versions which requires b command to be the
#r   last on the line, must do a sed '/bx;}/{G;s/bx;}\(\n\)/bx\1}/;}'
#r   on this file to break the line after the 'bx'
#r
#r and always remember, it's cool because it's SED. if you don't like it
#r you can try xsokoban instead <http://www.cs.cornell.edu/andru/xsokoban.html>
#r
#r CHANGES
#r 20020315 v0.0 debut release
#r 2002032? v0.1 clear screen, download note, fancy victory, sound ^G, lvl0
#r               fixed * on map bug, added :g, :r and :z commands
#r               pseudo-functions (now it's faster!)


#r skip functions
b zero

#r function welcome
:welcome
i\
       Welcome to the SED Sokoban\
\
Please select a level to begin [1-90]:
d

#r function loadmap
:loadmap

#r clear screen
i\
[2J

  /^0$/{s/.*/\
SED Sokoban - LEVEL 0 (victory test)\
\
     %%%%%            \
     %@o.%            \
     %%%%%            \
/; b endmap
}
  /^1$/{s/.*/\
SED Sokoban - LEVEL 1\
\
     %%%%%            \
     %   %            \
     %o  %            \
   %%%  o%%           \
   %  o o %           \
 %%% % %% %   %%%%%%  \
 %   % %% %%%%%  ..%  \
 % o  o          ..%  \
 %%%%% %%% %@%%  ..%  \
     %     %%%%%%%%%  \
     %%%%%%%          \
/; b endmap
}
  /^2$/{s/.*/\
SED Sokoban - LEVEL 2\
\
 %%%%%%%%%%%%         \
 %..  %     %%%       \
 %..  % o  o  %       \
 %..  %o%%%%  %       \
 %..    @ %%  %       \
 %..  % %  o %%       \
 %%%%%% %%o o %       \
   % o  o o o %       \
   %    %     %       \
   %%%%%%%%%%%%       \
/; b endmap
}
  /^3$/{s/.*/\
SED Sokoban - LEVEL 3\
\
         %%%%%%%%     \
         %     @%     \
         % o%o %%     \
         % o  o%      \
         %%o o %      \
 %%%%%%%%% o % %%%    \
 %....  %% o  o  %    \
 %%...    o  o   %    \
 %....  %%%%%%%%%%    \
 %%%%%%%%             \
/; b endmap
}
  /^4$/{s/.*/\
SED Sokoban - LEVEL 4\
\
            %%%%%%%%  \
            %  ....%  \
 %%%%%%%%%%%%  ....%  \
 %    %  o o   ....%  \
 % ooo%o  o %  ....%  \
 %  o     o %  ....%  \
 % oo %o o o%%%%%%%%  \
 %  o %     %         \
 %% %%%%%%%%%         \
 %    %    %%         \
 %     o   %%         \
 %  oo%oo  @%         \
 %    %    %%         \
 %%%%%%%%%%%          \
/; b endmap
}
  /^5$/{s/.*/\
SED Sokoban - LEVEL 5\
\
         %%%%%        \
         %   %%%%%    \
         % %o%%  %    \
         %     o %    \
 %%%%%%%%% %%%   %    \
 %....  %% o  o%%%    \
 %....    o oo %%     \
 %....  %%o  o @%     \
 %%%%%%%%%  o  %%     \
         % o o  %     \
         %%% %% %     \
           %    %     \
           %%%%%%     \
/; b endmap
}
  /^6$/{s/.*/\
SED Sokoban - LEVEL 6\
\
 %%%%%%  %%%          \
 %..  % %%@%%         \
 %..  %%%   %         \
 %..     oo %         \
 %..  % % o %         \
 %..%%% % o %         \
 %%%% o %o  %         \
    %  o% o %         \
    % o  o  %         \
    %  %%   %         \
    %%%%%%%%%         \
/; b endmap
}
  /^7$/{s/.*/\
SED Sokoban - LEVEL 7\
\
        %%%%%         \
  %%%%%%%   %%        \
 %% % @%% oo %        \
 %    o      %        \
 %  o  %%%   %        \
 %%% %%%%%o%%%        \
 % o  %%% ..%         \
 % o o o ...%         \
 %    %%%...%         \
 % oo % %...%         \
 %  %%% %%%%%         \
 %%%%                 \
/; b endmap
}
  /^8$/{s/.*/\
SED Sokoban - LEVEL 8\
\
   %%%%               \
   %  %%%%%%%%%%%     \
   %    o   o o %     \
   % o% o %  o  %     \
   %  o o  %    %     \
 %%% o% %  %%%% %     \
 %@%o o o  %%   %     \
 %    o %o%   % %     \
 %   o    o o o %     \
 %%%%%  %%%%%%%%%     \
   %      %           \
   %      %           \
   %......%           \
   %......%           \
   %......%           \
   %%%%%%%%           \
/; b endmap
}
  /^9$/{s/.*/\
SED Sokoban - LEVEL 9\
\
           %%%%%%%    \
           %  ...%    \
       %%%%%  ...%    \
       %      . .%    \
       %  %%  ...%    \
       %% %%  ...%    \
      %%% %%%%%%%%    \
      % ooo %%        \
  %%%%%  o o %%%%%    \
 %%   %o o   %   %    \
 %@ o  o    o  o %    \
 %%%%%% oo o %%%%%    \
      %      %        \
      %%%%%%%%        \
/; b endmap
}
  /^10$/{s/.*/\
SED Sokoban - LEVEL 10\
\
  %%%  %%%%%%%%%%%%%  \
 %%@%%%%       %   %  \
 % oo   oo  o o ...%  \
 %  ooo%    o  %...%  \
 % o   % oo oo %...%  \
 %%%   %  o    %...%  \
 %     % o o o %...%  \
 %    %%%%%% %%%...%  \
 %% %  %  o o  %...%  \
 %  %% % oo o o%%..%  \
 % ..% %  o      %.%  \
 % ..% % ooo ooo %.%  \
 %%%%% %       % %.%  \
     % %%%%%%%%% %.%  \
     %           %.%  \
     %%%%%%%%%%%%%%%  \
/; b endmap
}
  /^11$/{s/.*/\
SED Sokoban - LEVEL 11\
\
           %%%%       \
      %%%% %  %       \
    %%% @%%%o %       \
   %%      o  %       \
  %%  o oo%% %%       \
  %  %o%%     %       \
  % % o oo % %%%      \
  %   o %  % o %%%%%  \
 %%%%    %  oo %   %  \
 %%%% %% o         %  \
 %.    %%%  %%%%%%%%  \
 %.. ..% %%%%         \
 %...%.%              \
 %.....%              \
 %%%%%%%              \
/; b endmap
}
  /^12$/{s/.*/\
SED Sokoban - LEVEL 12\
\
 %%%%%%%%%%%%%%%%     \
 %              %     \
 % % %%%%%%     %     \
 % %  o o o o%  %     \
 % %   o@o   %% %%    \
 % %  o o o%%%...%    \
 % %   o o  %%...%    \
 % %%%ooo o %%...%    \
 %     % %% %%...%    \
 %%%%%   %% %%...%    \
     %%%%%     %%%    \
         %     %      \
         %%%%%%%      \
/; b endmap
}
  /^13$/{s/.*/\
SED Sokoban - LEVEL 13\
\
    %%%%%%%%%         \
   %%   %%  %%%%%     \
 %%%     %  %    %%%  \
 %  o %o %  %  ... %  \
 % % o%@o%% % %.%. %  \
 %  % %o  %    . . %  \
 % o    o % % %.%. %  \
 %   %%  %%o o . . %  \
 % o %   %  %o%.%. %  \
 %% o  o   o  o... %  \
  %o %%%%%%    %%  %  \
  %  %    %%%%%%%%%%  \
  %%%%                \
/; b endmap
}
  /^14$/{s/.*/\
SED Sokoban - LEVEL 14\
\
        %%%%%%%       \
  %%%%%%%     %       \
  %     % o@o %       \
  %oo %   %%%%%%%%%   \
  % %%%......%%   %   \
  %   o......%% % %   \
  % %%%......     %   \
 %%   %%%% %%% %o%%   \
 %  %o   %  o  % %    \
 %  o ooo  % o%% %    \
 %   o o %%%oo % %    \
 %%%%%     o   % %    \
     %%% %%%   % %    \
       %     %   %    \
       %%%%%%%%  %    \
              %%%%    \
/; b endmap
}
  /^15$/{s/.*/\
SED Sokoban - LEVEL 15\
\
    %%%%%%%%          \
    %   %  %          \
    %  o   %          \
  %%% %o   %%%%       \
  %  o  %%o   %       \
  %  % @ o % o%       \
  %  %      o %%%%    \
  %% %%%%o%%     %    \
  % o%.....% %   %    \
  %  o..OO. o% %%%    \
 %%  %.....%   %      \
 %   %%% %%%%%%%      \
 % oo  %  %           \
 %  %     %           \
 %%%%%%   %           \
      %%%%%           \
/; b endmap
}
  /^16$/{s/.*/\
SED Sokoban - LEVEL 16\
\
 %%%%%                \
 %   %%               \
 %    %  %%%%         \
 % o  %%%%  %         \
 %  oo o   o%         \
 %%%@ %o    %%        \
  %  %%  o o %%       \
  % o  %% %% .%       \
  %  %o%%o  %.%       \
  %%%   o..%%.%       \
   %    %.O...%       \
   % oo %.....%       \
   %  %%%%%%%%%       \
   %  %               \
   %%%%               \
/; b endmap
}
  /^17$/{s/.*/\
SED Sokoban - LEVEL 17\
\
    %%%%%%%%%%        \
    %..  %   %        \
    %..      %        \
    %..  %  %%%%      \
   %%%%%%%  %  %%     \
   %            %     \
   %  %  %%  %  %     \
 %%%% %%  %%%% %%     \
 %  o  %%%%% %  %     \
 % % o  o  % o  %     \
 % @o  o   %   %%     \
 %%%% %% %%%%%%%      \
    %    %            \
    %%%%%%            \
/; b endmap
}
  /^18$/{s/.*/\
SED Sokoban - LEVEL 18\
\
      %%%%%%%%%%%     \
      %  .  %   %     \
      % %.    @ %     \
  %%%%% %%..% %%%%    \
 %%  % ..%%%     %%%  \
 % o %...   o %  o %  \
 %    .. %%  %% %% %  \
 %%%%o%%o% o %   % %  \
   %% %    %o oo % %  \
   %  o % %  % o%% %  \
   %               %  \
   %  %%%%%%%%%%%  %  \
   %%%%         %%%%  \
/; b endmap
}
  /^19$/{s/.*/\
SED Sokoban - LEVEL 19\
\
   %%%%%%             \
   %   @%%%%          \
 %%%%% o   %          \
 %   %%    %%%%       \
 % o %  %%    %       \
 % o %  %%%%% %       \
 %% o  o    % %       \
 %% o o %%% % %       \
 %% %  o  % % %       \
 %% % %o%   % %       \
 %% %%%   % % %%%%%%  \
 %  o  %%%% % %....%  \
 %    o    o   ..%.%  \
 %%%%o  o% o   ....%  \
 %       %  %% ....%  \
 %%%%%%%%%%%%%%%%%%%  \
/; b endmap
}
  /^20$/{s/.*/\
SED Sokoban - LEVEL 20\
\
     %%%%%%%%%%       \
 %%%%%        %%%%    \
 %     %   o  %@ %    \
 % %%%%%%%o%%%%  %%%  \
 % %    %% %  %o ..%  \
 % % o     %  %  %.%  \
 % % o  %     %o ..%  \
 % %  %%% %%     %.%  \
 % %%%  %  %  %o ..%  \
 % %    %  %%%%  %.%  \
 % %o   o  o  %o ..%  \
 %    o % o o %  %.%  \
 %%%% o%%%    %o ..%  \
    %    oo %%%....%  \
    %      %% %%%%%%  \
    %%%%%%%%          \
/; b endmap
}
  /^21$/{s/.*/\
SED Sokoban - LEVEL 21\
\
 %%%%%%%%%            \
 %       %            \
 %       %%%%         \
 %% %%%% %  %         \
 %% %@%%    %         \
 % ooo o  oo%         \
 %  % %% o  %         \
 %  % %%  o %%%%      \
 %%%%  ooo o%  %      \
  %   %%   ....%      \
  % %   % %.. .%      \
  %   % % %%...%      \
  %%%%% o  %...%      \
      %%   %%%%%      \
       %%%%%          \
/; b endmap
}
  /^22$/{s/.*/\
SED Sokoban - LEVEL 22\
\
 %%%%%%     %%%%      \
 %    %%%%%%%  %%%%%  \
 %   o%  %  o  %   %  \
 %  o  o  o % o o  %  \
 %%o o   % @% o    %  \
 %  o %%%%%%%%%%% %%  \
 % %   %.......% o%   \
 % %%  % ......%  %   \
 % %   o........o %   \
 % % o %.... ..%  %   \
 %  o o%%%%o%%%% o%   \
 % o   %%% o   o  %%  \
 % o     o o  o    %  \
 %% %%%%%% o %%%%% %  \
 %         %       %  \
 %%%%%%%%%%%%%%%%%%%  \
/; b endmap
}
  /^23$/{s/.*/\
SED Sokoban - LEVEL 23\
\
     %%%%%%%          \
     %  %  %%%%       \
 %%%%% o%o %  %%      \
 %.. %  %  %   %      \
 %.. % o%o %  o%%%%   \
 %.  %     %o  %  %   \
 %..   o%  % o    %   \
 %..@%  %o %o  %  %   \
 %.. % o%     o%  %   \
 %.. %  %oo%o  %  %%  \
 %.. % o%  %  o%o  %  \
 %.. %  %  %   %   %  \
 %%. %%%%  %%%%%   %  \
  %%%%  %%%%   %%%%%  \
/; b endmap
}
  /^24$/{s/.*/\
SED Sokoban - LEVEL 24\
\
 %%%%%%%%%%%%%%%      \
 %..........  .%%%%   \
 %..........oo.%  %   \
 %%%%%%%%%%%o %   %%  \
 %      o  o     o %  \
 %% %%%%   %  o %  %  \
 %      %   %%  % %%  \
 %  o%  % %%  %%% %%  \
 % o %o%%%    %%% %%  \
 %%%  o %  %  %%% %%  \
 %%%    o %% %  % %%  \
  % o  %  o  o o   %  \
  %  o  o%ooo  %   %  \
  %  %  o      %%%%%  \
  % @%%  %  %  %      \
  %%%%%%%%%%%%%%      \
/; b endmap
}
  /^25$/{s/.*/\
SED Sokoban - LEVEL 25\
\
 %%%%                 \
 %  %%%%%%%%%%%%%%    \
 %  %   ..%......%    \
 %  % % %%%%% ...%    \
 %%o%    ........%    \
 %   %%o%%%%%%  %%%%  \
 % o %     %%%%%%@ %  \
 %%o % o   %%%%%%  %  \
 %  o %ooo%%       %  \
 %      %    %o%o%%%  \
 % %%%% %ooooo    %   \
 % %    o     %   %   \
 % %   %%        %%%  \
 % %%%%%%o%%%%%% o %  \
 %        %    %   %  \
 %%%%%%%%%%    %%%%%  \
/; b endmap
}
  /^26$/{s/.*/\
SED Sokoban - LEVEL 26\
\
  %%%%%%%             \
  %  %  %%%%%         \
 %%  %  %...%%%       \
 %  o%  %...  %       \
 % o %oo ...  %       \
 %  o%  %... .%       \
 %   % o%%%%%%%%      \
 %%o       o o %      \
 %%  %  oo %   %      \
  %%%%%%  %%oo@%      \
       %      %%      \
       %%%%%%%%       \
/; b endmap
}
  /^27$/{s/.*/\
SED Sokoban - LEVEL 27\
\
  %%%%%%%%%%%%%%%%%   \
  %...   %    %   %%  \
 %%.....  o%% % %o %  \
 %......%  o  %    %  \
 %......%  %  % %  %  \
 %%%%%%%%% o  o o  %  \
   %     %o%%o %%o%%  \
  %%   o    % o    %  \
  %  %% %%% %  %%o %  \
  % o oo     o  o  %  \
  % o    o%%o %%%%%%  \
  %%%%%%%  @ %%       \
        %%%%%%        \
/; b endmap
}
  /^28$/{s/.*/\
SED Sokoban - LEVEL 28\
\
          %%%%%       \
      %%%%%   %       \
     %% o  o  %%%%    \
 %%%%% o  o o %%.%    \
 %       oo  %%..%    \
 %  %%%%%% %%%.. %    \
 %% %  %    %... %    \
 % o   %    %... %    \
 %@ %o %% %%%%...%    \
 %%%%  o oo  %%..%    \
    %%  o o  o...%    \
     % oo  o %  .%    \
     %   o o  %%%%    \
     %%%%%%   %       \
          %%%%%       \
/; b endmap
}
  /^29$/{s/.*/\
SED Sokoban - LEVEL 29\
\
 %%%%%                \
 %   %%               \
 % o  %%%%%%%%%       \
 %% % %       %%%%%%  \
 %% %   o%o%@  %   %  \
 %  %      o %   o %  \
 %  %%% %%%%%%%%% %%  \
 %  %% ..O..... % %%  \
 %% %% O.O..O.O % %%  \
 % o%%%%%%%%%% %%o %  \
 %  o   o  o    o  %  \
 %  %   %   %   %  %  \
 %%%%%%%%%%%%%%%%%%%  \
/; b endmap
}
  /^30$/{s/.*/\
SED Sokoban - LEVEL 30\
\
        %%%%%%%%%%%   \
        %   %     %   \
 %%%%%  %     o o %   \
 %   %%%%% o%% % %%   \
 % o %%   % %% o  %   \
 % o  @oo % %%ooo %   \
 %% %%%   % %%    %   \
 %% %   %%% %%%%%o%   \
 %% %     o  %....%   \
 %  %%% %% o %....%%  \
 % o   o %   %..o. %  \
 %  %% o %  %%.... %  \
 %%%%%   %%%%%%...%%  \
     %%%%%    %%%%%   \
/; b endmap
}
  /^31$/{s/.*/\
SED Sokoban - LEVEL 31\
\
   %%%%               \
   %  %%%%%%%%%       \
  %%  %%  %   %       \
  %  o% o@o   %%%%    \
  %o  o  % o o%  %%   \
 %%  o%% %o o     %   \
 %  %  % %   ooo  %   \
 % o    o  o%% %%%%   \
 % o o %o%  %  %      \
 %%  %%%  %%%o %      \
  %  %....     %      \
  %%%%......%%%%      \
    %....%%%%         \
    %...%%            \
    %...%             \
    %%%%%             \
/; b endmap
}
  /^32$/{s/.*/\
SED Sokoban - LEVEL 32\
\
       %%%%           \
   %%%%%  %           \
  %%     o%           \
 %% o  %% %%%         \
 %@o o % o  %         \
 %%%% %%   o%         \
  %....%o o %         \
  %....%   o%         \
  %....  oo %%        \
  %... % o   %        \
  %%%%%%o o  %        \
       %   %%%        \
       %o %%%         \
       %  %           \
       %%%%           \
/; b endmap
}
  /^33$/{s/.*/\
SED Sokoban - LEVEL 33\
\
  %%%%%%%%%%%         \
  %     %%  %         \
  %   o   o %         \
 %%%% %% oo %         \
 %   o %    %         \
 % ooo % %%%%         \
 %   % % o %%         \
 %  %  %  o %         \
 % o% o%    %         \
 %   ..% %%%%         \
 %%%%.. o %@%         \
 %.....% o% %         \
 %%....%  o %         \
  %%..%%    %         \
   %%%%%%%%%%         \
/; b endmap
}
  /^34$/{s/.*/\
SED Sokoban - LEVEL 34\
\
  %%%%%%%%%           \
  %....   %%          \
  %.%.%  o %%         \
 %%....% % @%%        \
 % ....%  %  %%       \
 %     %o %%o %       \
 %% %%%  o    %       \
  %o  o o o%  %       \
  % %  o o %% %       \
  %  %%%  %%  %       \
  %    %% %% %%       \
  %  o %  o  %        \
  %%%o o   %%%        \
    %  %%%%%          \
    %%%%              \
/; b endmap
}
  /^35$/{s/.*/\
SED Sokoban - LEVEL 35\
\
 %%%%%%%%%%%% %%%%%%  \
 %   %    % %%%....%  \
 %   oo%   @  .....%  \
 %   % %%%   % ....%  \
 %% %% %%%  %  ....%  \
  % o o     % % %%%%  \
  %  o o%%  %      %  \
 %%%% %  %%%% % %% %  \
 %  % %o   %% %    %  \
 % o  o  % %% %   %%  \
 % % o o    % %   %   \
 %  o %% %% % %%%%%   \
 % oo     oo  %       \
 %% %% %%% o  %       \
  %    % %    %       \
  %%%%%% %%%%%%       \
/; b endmap
}
  /^36$/{s/.*/\
SED Sokoban - LEVEL 36\
\
             %%%%%    \
 %%%%%  %%%%%%   %    \
 %   %%%%  o o o %    \
 % o   %% %% %%  %%   \
 %   o o     o  o %   \
 %%% o  %% %%     %%  \
   % %%%%% %%%%%oo %  \
  %%o%%%%% @%%     %  \
  % o  %%%o%%% o  %%  \
  % o  %   %%%  %%%   \
  % oo o %   oo %     \
  %     %   %%  %     \
  %%%%%%%.. .%%%      \
     %.........%      \
     %.........%      \
     %%%%%%%%%%%      \
/; b endmap
}
  /^37$/{s/.*/\
SED Sokoban - LEVEL 37\
\
 %%%%%%%%%%%          \
 %......   %%%%%%%%%  \
 %......   %  %%   %  \
 %..%%% o    o     %  \
 %... o o %   %%   %  \
 %...%o%%%%%    %  %  \
 %%%    %   %o  %o %  \
   %  oo o o  o%%  %  \
   %  o   %o%o %%o %  \
   %%% %% %    %%  %  \
    %  o o %% %%%%%%  \
    %    o  o  %      \
    %%   % %   %      \
     %%%%%@%%%%%      \
         %%%          \
/; b endmap
}
  /^38$/{s/.*/\
SED Sokoban - LEVEL 38\
\
       %%%%           \
 %%%%%%% @%           \
 %     o  %           \
 %   o%% o%           \
 %%o%...% %           \
  % o...  %           \
  % %. .% %%          \
  %   % %o %          \
  %o  o    %          \
  %  %%%%%%%          \
  %%%%                \
/; b endmap
}
  /^39$/{s/.*/\
SED Sokoban - LEVEL 39\
\
              %%%%%%  \
  %%%%%%%%%%%%%....%  \
 %%   %%     %%....%  \
 %  oo%%  o @%%....%  \
 %      oo o%  ....%  \
 %  o %% oo % % ...%  \
 %  o %% o  %  ....%  \
 %% %%%%% %%% %%.%%%  \
 %%   o  o %%   .  %  \
 % o%%%  % %%%%% %%%  \
 %   o   %       %    \
 %  o %o o o%%%  %    \
 % ooo% o   % %%%%    \
 %    %  oo %         \
 %%%%%%   %%%         \
      %%%%%           \
/; b endmap
}
  /^40$/{s/.*/\
SED Sokoban - LEVEL 40\
\
     %%%%%%%%%%%%     \
     %          %%    \
     %  % %oo o  %    \
     %o %o%  %% @%    \
    %% %% % o % %%    \
    %   o %o  % %     \
    %   % o   % %     \
    %% o o   %% %     \
    %  %  %%  o %     \
    %    %% oo% %     \
 %%%%%%oo   %   %     \
 %....%  %%%%%%%%     \
 %.%... %%            \
 %....   %            \
 %....   %            \
 %%%%%%%%%            \
/; b endmap
}
  /^41$/{s/.*/\
SED Sokoban - LEVEL 41\
\
            %%%%%     \
           %%   %%    \
          %%     %    \
         %%  oo  %    \
        %% oo  o %    \
        % o    o %    \
 %%%%   %   oo %%%%%  \
 %  %%%%%%%% %%    %  \
 %.            ooo@%  \
 %.% %%%%%%% %%   %%  \
 %.% %%%%%%%. %o o%%  \
 %........... %    %  \
 %%%%%%%%%%%%%%  o %  \
              %%  %%  \
               %%%%   \
/; b endmap
}
  /^42$/{s/.*/\
SED Sokoban - LEVEL 42\
\
      %%%%%%%%        \
   %%%%      %%%%%%   \
   %    %% o o   @%   \
   % %% %%o%o o o%%   \
 %%% ......%  oo %%   \
 %   ......%  %   %   \
 % % ......%o  o  %   \
 % %o...... oo% o %   \
 %   %%% %%%o  o %%   \
 %%%  o  o  o  o %    \
   %  o  o  o  o %    \
   %%%%%%   %%%%%%    \
        %%%%%         \
/; b endmap
}
  /^43$/{s/.*/\
SED Sokoban - LEVEL 43\
\
         %%%%%%%      \
     %%%%%  %  %%%%   \
     %   %   o    %   \
  %%%% %oo %% %%  %   \
 %%      % %  %% %%%  \
 %  %%% o%o  o  o  %  \
 %...    % %%  %   %  \
 %...%    @ % %%% %%  \
 %...%  %%%  o  o  %  \
 %%%%%%%% %%   %   %  \
           %%%%%%%%%  \
/; b endmap
}
  /^44$/{s/.*/\
SED Sokoban - LEVEL 44\
\
  %%%%%               \
  %   %               \
  % % %%%%%%%         \
  %      o@%%%%%%     \
  % o %%o %%%   %     \
  % %%%% o    o %     \
  % %%%%% %  %o %%%%  \
 %%  %%%% %%o      %  \
 %  o%  o  % %% %% %  \
 %         % %...% %  \
 %%%%%%  %%%  ...  %  \
      %%%% % %...% %  \
           % %%% % %  \
           %       %  \
           %%%%%%%%%  \
/; b endmap
}
  /^45$/{s/.*/\
SED Sokoban - LEVEL 45\
\
 %%%%% %%%%           \
 %...% %  %%%%        \
 %...%%%  o  %        \
 %....%% o  o%%%      \
 %%....%%   o  %      \
 %%%... %% o o %      \
 % %%    %  o  %      \
 %  %% % %%% %%%%     \
 % o % %o  o    %     \
 %  o @ o    o  %     \
 %   % o oo o %%%     \
 %  %%%%%%  %%%       \
 % %%    %%%%         \
 %%%                  \
/; b endmap
}
  /^46$/{s/.*/\
SED Sokoban - LEVEL 46\
\
 %%%%%%%%%%           \
 %        %%%%        \
 % %%%%%% %  %%       \
 % % o o o  o %       \
 %       %o   %       \
 %%%o  oo%  %%%       \
   %  %% % o%%        \
   %%o%   o @%        \
    %  o o %%%        \
    % %   o  %        \
    % %%   % %        \
   %%  %%%%% %        \
   %         %        \
   %.......%%%        \
   %.......%          \
   %%%%%%%%%          \
/; b endmap
}
  /^47$/{s/.*/\
SED Sokoban - LEVEL 47\
\
          %%%%        \
  %%%%%%%%%  %%       \
 %%  o      o %%%%%   \
 %   %% %%   %%...%   \
 % %oo o oo%o%%...%   \
 % %   @   %   ...%   \
 %  o% %%%oo   ...%   \
 % o  oo  o %%....%   \
 %%%o       %%%%%%%   \
   %  %%%%%%%         \
   %%%%               \
/; b endmap
}
  /^48$/{s/.*/\
SED Sokoban - LEVEL 48\
\
   %%%%%%%%%          \
   %O.O%O.O%          \
   %.O.O.O.%          \
   %O.O.O.O%          \
   %.O.O.O.%          \
   %O.O.O.O%          \
   %%%   %%%          \
     %   %            \
 %%%%%% %%%%%%        \
 %           %        \
 % o o o o o %        \
 %% o o o o %%        \
  %o o o o o%         \
  %   o@o   %         \
  %  %%%%%  %         \
  %%%%   %%%%         \
/; b endmap
}
  /^49$/{s/.*/\
SED Sokoban - LEVEL 49\
\
        %%%%          \
        %  %%         \
        %   %%        \
        % oo %%       \
      %%%o  o %%      \
   %%%%    o   %      \
 %%%  % %%%%%  %      \
 %    % %....o %      \
 % %   o ....% %      \
 %  o % %.O..% %      \
 %%%  %%%% %%% %      \
   %%%% @o  %%o%%     \
      %%% o     %     \
        %  %%   %     \
        %%%%%%%%%     \
/; b endmap
}
  /^50$/{s/.*/\
SED Sokoban - LEVEL 50\
\
       %%%%%%%%%%%%   \
      %%..    %   %   \
     %%..O o    o %   \
    %%..O.% % % o%%   \
    %..O.% % % o  %   \
 %%%%...%  %    % %   \
 %  %% %          %   \
 % @o o %%%  %   %%   \
 % o   o   % %   %    \
 %%%oo   % % % % %    \
   %   o   % % %%%%%  \
   % o% %%%%%      %  \
   %o   %   %    % %  \
   %  %%%   %%     %  \
   %  %      %    %%  \
   %%%%      %%%%%%   \
/; b endmap
}
  /^51$/{s/.*/\
SED Sokoban - LEVEL 51\
\
  %%%%%%%%%           \
  %       %           \
  % o oo o%           \
 %%% %  o %           \
 %.%   oo %%          \
 %.%%%   o %          \
 %.%. o %% %%%%       \
 %...  o%% o  %       \
 %...o   o    %       \
 %..%%%o%%% %@%       \
 %..% %     %%%       \
 %%%% %%%%%%%         \
/; b endmap
}
  /^52$/{s/.*/\
SED Sokoban - LEVEL 52\
\
            %%%%%%%%  \
            %......%  \
    %%%%    %......%  \
    %  %%%%%%%%%...%  \
    % o   o    %...%  \
    %  % % % % %   %  \
 %%%%% % % %@% %   %  \
 %   % %%% %%% %% %%  \
 %    o % o o o % %   \
 % ooo  o   %     %   \
 %   % %%%o%%%o%% %   \
 %%% %  o   %     %   \
  %% o  % o o o %%%   \
  %  % %%% %%% %%     \
  % o          %      \
  %  %%%%%%%%%%%      \
  %%%%                \
/; b endmap
}
  /^53$/{s/.*/\
SED Sokoban - LEVEL 53\
\
 %%%%%%%%%%%%%%%%%%   \
 %                %%  \
 % o%   o %%  o    %  \
 %    o%%%    % oo %  \
 %.%%%     o o %%  %% \
 %...%  %  %    %o  % \
 %..%%oo%%%% o  %   % \
 %...%      o %%  %%% \
 %...o  %%%  %    % % \
 %%..  o%  %%   %%@ % \
  %%.%              % \
   %%%%%%%%%%%%%%%%%% \
/; b endmap
}
  /^54$/{s/.*/\
SED Sokoban - LEVEL 54\
\
 %%%%%%%%%%%%%%%%%%%% \
 %   %    %   %   %@% \
 % o      o   o   % % \
 %% %%%..%% %%%     % \
 %   %....%o%  o%%% % \
 % o %....%  o  o o % \
 %   %....% % % o o % \
 %   %%..%%   %o%   % \
 %%o%%    %%  %  %o%% \
 %   o  o     %  %  % \
 %   %    %   %     % \
 %%%%%%%%%%%%%%%%%%%% \
/; b endmap
}
  /^55$/{s/.*/\
SED Sokoban - LEVEL 55\
\
 %%%%%%%%%%%%%%%%%%%% \
 %    @%%      %   %% \
 %    %%    o    o %% \
 %  %%%....% % %  %%% \
 %   %....% % % o   % \
 %%% %...%  %       % \
 %%  %%.%     o   o % \
 %%  o o %%%  % % %%% \
 %% o       % % o   % \
 %%%% o  o% % % % o % \
 %%%%         % %  %% \
 %%%%%%%%%%%%%%%%%%%% \
/; b endmap
}
  /^56$/{s/.*/\
SED Sokoban - LEVEL 56\
\
 %%%%%%%%%%%%%%%%%%%% \
 %  %  %%    %   @%%% \
 %%    o    % o%%%  % \
 %%o% o %%o% o o    % \
 %   o%    o      %%% \
 % %%   o %%%  %....% \
 % % o% % % % %....%% \
 %    o o %  %....%%% \
 %%o %%%  o %....%%%% \
 %  % o        %%%%%% \
 %      % %    %%%%%% \
 %%%%%%%%%%%%%%%%%%%% \
/; b endmap
}
  /^57$/{s/.*/\
SED Sokoban - LEVEL 57\
\
 %%%%%%%%%%%%%%%%%%%% \
 %@     %%%   %  %  % \
 % % %  %  o  o     % \
 %%%%%     % o o%o% % \
 %.%..%    %%o o    % \
 %.....    o   %   %% \
 %.....    %%%o%%o%%% \
 %.%..%    o    %   % \
 %%%%%     %  %o  o % \
 %%%%%  %  o    o o % \
 %%%%%  %  %  %  %  % \
 %%%%%%%%%%%%%%%%%%%% \
/; b endmap
}
  /^58$/{s/.*/\
SED Sokoban - LEVEL 58\
\
 %%%%%%%%%%%%%%%%%%%% \
 %%...   %% %    %  % \
 %....         o %% % \
 %....% % %o%%%o    % \
 %...%    %       % % \
 %%.%  %o %     o%% % \
 %  %  % o o %%%  o % \
 %     o  o %  % %% % \
 %% % %% %oo% o%  % % \
 %  %   o o %      %% \
 %    %     %  %   @% \
 %%%%%%%%%%%%%%%%%%%% \
/; b endmap
}
  /^59$/{s/.*/\
SED Sokoban - LEVEL 59\
\
 %%%%%%%%%%%%%%%%%%%% \
 %   %  %@% %%  %%%%% \
 % % %  o    o  %%%%% \
 % %    %%%%%% o  %%% \
 %   %  %....%  oo  % \
 %%o%%o%%....%      % \
 %      %....%%o%%o%% \
 %  oo  %....%      % \
 % o  o  %  %  %%%  % \
 %%%%%  o   o    o  % \
 %%%%% %    %  %   %% \
 %%%%%%%%%%%%%%%%%%%% \
/; b endmap
}
  /^60$/{s/.*/\
SED Sokoban - LEVEL 60\
\
 %%%%%%%%%%%%%%%%%%%% \
 % %     %          % \
 %       o  %% %%% %% \
 %%%%%  %%   o  o   % \
 %%..%%  % % o % %  % \
 %....  o     %%o% %% \
 %....  o%%%%%   %o%% \
 %%..% %  %   %  o  % \
 %%%.% %  o   o  % @% \
 %%  o  o %   %  %%%% \
 %%       %%%%%%%%%%% \
 %%%%%%%%%%%%%%%%%%%% \
/; b endmap
}
  /^61$/{s/.*/\
SED Sokoban - LEVEL 61\
\
 %%%%%%%%%%%%%%%%%%%% \
 %     %%%..%%%     % \
 % oo  %%%..%%%  o@ % \
 %  % %%......%  o  % \
 %     %......%  o  % \
 %%%%  %%%..%%%%%%o % \
 %   ooo %..%    %  % \
 % o%   o  o  oo %o % \
 %  %  %% o  %%  %  % \
 % o    o %% o    o % \
 %  %  %%    %%  %  % \
 %%%%%%%%%%%%%%%%%%%% \
/; b endmap
}
  /^62$/{s/.*/\
SED Sokoban - LEVEL 62\
\
 %%%%%%%%%%%%%%%%%%%% \
 %    %  % %  %  %  % \
 % @% % %% o   o   %% \
 %%%% %    %  % o   % \
 %    % %% %o %% %% % \
 %      o   o   o   % \
 %..%%%oo%% o%%o %% % \
 %..%.%  % o   o %  % \
 %....% oo   %%o %%%% \
 %....%  %%%%%      % \
 %...%%%        %%  % \
 %%%%%%%%%%%%%%%%%%%% \
/; b endmap
}
  /^63$/{s/.*/\
SED Sokoban - LEVEL 63\
\
 %%%%%%%%%%%%%%%%%%%% \
 %....%       %  %  % \
 %....% % o  o      % \
 %.... %%  o% % o%o % \
 %...%   o   o%  o  % \
 %..%%%%  % o   oo  % \
 %      %%%% %%%% %%% \
 %        %   %     % \
 % %%   %   o % o o % \
 % %%    o %% o  o  % \
 %     @%     %   % % \
 %%%%%%%%%%%%%%%%%%%% \
/; b endmap
}
  /^64$/{s/.*/\
SED Sokoban - LEVEL 64\
\
 %%%%%%%%%%%%%%%%%%%% \
 %....%%%           % \
 %....%%%%% %  %o% %% \
 %....%%%   %o  o   % \
 %....%%%    o  %oo%% \
 %%  %%%% o%  %o o  % \
 %%  %%%%  o  o  %  % \
 %@  %%%%o%%%o%% o  % \
 %%        %  %  o  % \
 %%   %%%  %  o  %%%% \
 %%%%%%%%  %  %     % \
 %%%%%%%%%%%%%%%%%%%% \
/; b endmap
}
  /^65$/{s/.*/\
SED Sokoban - LEVEL 65\
\
 %%%%%%%%%%%%%%%%%%%% \
 %     %     @%...%%% \
 %     %      %%...%% \
 % % % %%o%% %% ....% \
 %   o %   ooo  ....% \
 %%%o%%% oo  %%% %%.% \
 %     o  %    % %%%% \
 %  o  %  %%%  % %  % \
 %% %o%%    o  oo   % \
 %   o %%   %  % %  % \
 %     %    %  %    % \
 %%%%%%%%%%%%%%%%%%%% \
/; b endmap
}
  /^66$/{s/.*/\
SED Sokoban - LEVEL 66\
\
 %%%%%%%%%%%%%%%%%%%% \
 %     %  %...%@    % \
 % %       ....%    % \
 %  o  %   %....%   % \
 % %%o%%%% %%....%  % \
 % o   o  %  %...%  % \
 % oo %   %   % oo  % \
 %%%  ooo%   oo  o  % \
 % o  %  %    % o%  % \
 %   o%  %       o  % \
 %  %    %    %  %  % \
 %%%%%%%%%%%%%%%%%%%% \
/; b endmap
}
  /^67$/{s/.*/\
SED Sokoban - LEVEL 67\
\
 %%%%%%%%%%%%%%%%%%%% \
 %%%%%@%%%.%%...%%  % \
 %%%%%o  ..%...%    % \
 %%%%    ......%  o % \
 %%%  o %.....%% % %% \
 %%  oo% %%%%%  o o % \
 %% o% o    %%  oo  % \
 %%  %  %    % o  o % \
 %%   oo %%% %o%%   % \
 %% o%      o o  o %% \
 %%%    %    %    %%% \
 %%%%%%%%%%%%%%%%%%%% \
/; b endmap
}
  /^68$/{s/.*/\
SED Sokoban - LEVEL 68\
\
 %%%%%%%%%%%%%%%%%%%% \
 %@     %   %       % \
 %% %%% %%  %%%% % %% \
 %    % %  oo       % \
 %  % % % o % o %% %% \
 %     o %  %oo %   % \
 %  %%%  %      %% %% \
 %..%.% o %  o %    % \
 %..%.%  o % %% oo  % \
 %....%%   oo  o  % % \
 %.....%%        %  % \
 %%%%%%%%%%%%%%%%%%%% \
/; b endmap
}
  /^69$/{s/.*/\
SED Sokoban - LEVEL 69\
\
 %%%%%%%%%%%%%%%%%%%% \
 %  %      %   %   %% \
 % o% o o %%...o  o % \
 %  o  % %%....% o  % \
 % %% o %%....%   o % \
 % o    %....%% o   % \
 % o%%  %...%       % \
 %   ooo%%o%%  %%% %% \
 % % %  %   %  %    % \
 % o %  o  %%       % \
 %    %    %@       % \
 %%%%%%%%%%%%%%%%%%%% \
/; b endmap
}
  /^70$/{s/.*/\
SED Sokoban - LEVEL 70\
\
 %%%%%%%%%%%%%%%%%%%% \
 %  %  % %    %  %  % \
 %   o      o o     % \
 %% %  %o%%%o%%  %% % \
 %   o     o  %  o  % \
 % %%%o%%o%   % o   % \
 % %   o o  %%%%%% o% \
 % o  oo o  %@%.%...% \
 % %     %  % %.%...% \
 % %%%%%%%%%% %.....% \
 %            %.....% \
 %%%%%%%%%%%%%%%%%%%% \
/; b endmap
}
  /^71$/{s/.*/\
SED Sokoban - LEVEL 71\
\
 %%%%%%%%%%%%%%%%%%%% \
 %  %     %  %%    %% \
 % o%   o %     %%  % \
 % o  o  %..%     o % \
 % o o  %....%   % %% \
 % o%  %......%%% o % \
 %   %  %....%  %o  % \
 % o  %%%%..%   %   % \
 %% o   %% % % o  o%% \
 %%% o    o%@o o%   % \
 %%%%   %       %   % \
 %%%%%%%%%%%%%%%%%%%% \
/; b endmap
}
  /^72$/{s/.*/\
SED Sokoban - LEVEL 72\
\
 %%%%%%%%%%%%%%%%%%%% \
 %      ....%    %%%% \
 %      ....        % \
 % % %%%%%%%%%%     % \
 % %o   %      %%%..% \
 %  o   %oo%%%   %..% \
 % o %%% o   o   %..% \
 % o %   o o %  %%..% \
 %  %  oo % o %%   %% \
 %@%% o%  o  o     %% \
 %%       %%   %  %%% \
 %%%%%%%%%%%%%%%%%%%% \
/; b endmap
}
  /^73$/{s/.*/\
SED Sokoban - LEVEL 73\
\
 %%%%%%%%%%%%%%%%%%%% \
 %        %   %@ %  % \
 % oo  %oo% % %  %% % \
 %  % o o %oo %     % \
 %% %  %  % % %  %  % \
 %   %%       %     % \
 %   % o %   %   %  % \
 % o %o %   %  o %..% \
 %%o %  %%%%    %...% \
 %  o          %....% \
 %   %  %     %.....% \
 %%%%%%%%%%%%%%%%%%%% \
/; b endmap
}
  /^74$/{s/.*/\
SED Sokoban - LEVEL 74\
\
 %%%%%%%%%%%%%%%%%%%% \
 %     %   %%%%%    % \
 %% o  %   %%%%  o  % \
 %%%% oo   %..%  %  % \
 %  o  o  %%..%%%% %% \
 % o   %%%....   oo % \
 %  %o%   ....% % o % \
 % %  % o ..%%%o%   % \
 % %   o %..%   %%  % \
 %   o%  %%%%   % o%% \
 % %  %    @%      %% \
 %%%%%%%%%%%%%%%%%%%% \
/; b endmap
}
  /^75$/{s/.*/\
SED Sokoban - LEVEL 75\
\
 %%%%%%%%%%%%%%%%%%%% \
 %   %   %    %   %@% \
 %   o  o     % o % % \
 %%o% o%%% %    oo% % \
 %  %  %.%%%  %o o  % \
 %  %o%....%  % %%% % \
 % o  %.....%%    % % \
 %%o  %.%....%oo o  % \
 %  %%%%%%..%% %  % % \
 %  o         o %%% % \
 %   %   %        % % \
 %%%%%%%%%%%%%%%%%%%% \
/; b endmap
}
  /^76$/{s/.*/\
SED Sokoban - LEVEL 76\
\
 %%%%%%%%%%%%%%%%%%%% \
 % % % %   %@%%   % % \
 %             o    % \
 %  %%o% %%%%% o % %% \
 %%    %%.....%  %  % \
 %%o%%o%.....%%%o%o % \
 %   % %%.....%  % %% \
 %  o    %%..%%  %  % \
 % o %   o   o  ooo % \
 %% o  o% %  %  o   % \
 %   %%   %  %      % \
 %%%%%%%%%%%%%%%%%%%% \
/; b endmap
}
  /^77$/{s/.*/\
SED Sokoban - LEVEL 77\
\
 %%%%%%%%%%%%%%%%%%%% \
 %    %%   %    %   % \
 %  o  o     %% o   % \
 %% %%%%%  .%%%%%% %% \
  % %%  %%....%%%% %% \
 %% %%o %%%..%%     % \
 %      %... .% o o % \
 % o %% %% . %%% %%%% \
 % % o    %.%% % %    \
 % o o %   .%%%% %%   \
 % %  %% % %%  %  %%  \
 %%%%%%%  o%%o   o %  \
       %%      o %@%  \
        %  %% %%%%%%  \
        %%%%%%%       \
/; b endmap
}
  /^78$/{s/.*/\
SED Sokoban - LEVEL 78\
\
        %%%%%%%%%%%   \
        %         %   \
        %    o o  %   \
 %%%%%% % o %%%%% %   \
 %    %%%%% o  %%o%   \
 %       o o      %   \
 %          %% %% %   \
 %    %%@%%%%% %% %   \
 %    %%%%   % %% %%  \
 %....%      % o   %  \
 %....%      %     %  \
 %%%%%%      %%%%%%%  \
/; b endmap
}
  /^79$/{s/.*/\
SED Sokoban - LEVEL 79\
\
 %%%%%%%%%%%%%        \
 %           %        \
 % %%% oo    %        \
 %   % o  o  %        \
 %  o%%%%o%%%%%%      \
 % o %%        %%%%%  \
 %  oo o        ...%  \
 %%% %% oo%     ...%  \
   % %%   %     ...%  \
   %      %     ...%  \
   %%%@%%%%%%%%%%%%%  \
     %%%              \
/; b endmap
}
  /^80$/{s/.*/\
SED Sokoban - LEVEL 80\
\
   %%%%%%%%%%%%%%%%%  \
 %%%@%%         ...%  \
 %    %         ...%  \
 % o  %         ...%  \
 % oo %         ...%  \
 %% o %%%o%%%%%%%%%%  \
  % %%%  o %          \
 %%   o  o %          \
 %  o %  o %          \
 % o  %    %          \
 %  o %    %          \
 %    %    %          \
 %%%%%%%%%%%          \
/; b endmap
}
  /^81$/{s/.*/\
SED Sokoban - LEVEL 81\
\
               %%%%%  \
      %%%%%%%%%%   %  \
      %        %   %  \
      %  o o    oo %  \
      % %%%%% %% o %  \
      %oo   %o%% o %  \
      % %%% % %%o  %  \
 %%%%%% %%% o o    %  \
 %....        %%   %  \
 %....        %%%%%%  \
 %....        %       \
 %%%%%%%%%%%@%%       \
           %%%        \
/; b endmap
}
  /^82$/{s/.*/\
SED Sokoban - LEVEL 82\
\
     %%%%%%           \
  %%%%    %           \
  %    %% %           \
  % o     %           \
 %%% %%%% %%%%%%%%    \
 %  o   o %%  ...%    \
 %   oo oo    ...%    \
 %    o  o%%  ...%    \
 %%@%% %% %%  ...%    \
  %%%  o  %%%%%%%%    \
  %   oo  %           \
  %    %  %           \
  %%%%%%%%%           \
/; b endmap
}
  /^83$/{s/.*/\
SED Sokoban - LEVEL 83\
\
 %%%%%%% %%%%%%%%%    \
 %     % %   %%  %    \
 % %%% % %   o   %    \
 % % o %%%   o   %    \
 %   oo      %%o %    \
 %    %%%%   %%  %    \
 %@%%%%%%%%%%%% %%    \
 %%%..    %%%%%o %    \
   %..    %%%%   %    \
   %..       oo  %    \
   %..    %%%% o %    \
   %..    %  %   %    \
   %%%%%%%%  %%%%%    \
/; b endmap
}
  /^84$/{s/.*/\
SED Sokoban - LEVEL 84\
\
 %%%%%%%              \
 %     %%%%%%%%%%     \
 %     %    %  %%     \
 % o   %   o o  %     \
 %  o  %  o %%  %     \
 % oo  %%o o    %     \
 %% %  %% %%%%%%%     \
 %% %  %%    ...%     \
 %  %o       ...%     \
 %   oo      ...%     \
 %     %%@%  ...%     \
 %%%%%%%%%%%%%%%%     \
/; b endmap
}
  /^85$/{s/.*/\
SED Sokoban - LEVEL 85\
\
 %%%%%%%%%%%%         \
 %      %   %%        \
 % o  o   %  %%%%%%   \
 %%%%  %%%%%      %   \
  %..  %     %%%% %   \
  %.%%%%  %%%%    %   \
  %....    %  o %%%%  \
  % ...%   % ooo%  %% \
 %%%.%%%% %%  o@o   % \
 %     %%%%% o %    % \
 % %.% o      o%%%o % \
 % %.%%%%%%%%  %  o % \
 % %..        %%  o % \
 % % %%%%%%% o % %  % \
 %   %     %       %% \
 %%%%%     %%%%%%%%%% \
/; b endmap
}
  /^86$/{s/.*/\
SED Sokoban - LEVEL 86\
\
 %%%%%%%%%%%%%%%%     \
 %       %@ %   %     \
 % % % % % o  oo%     \
 % %...% %ooo   %     \
 %  ...% % o  oo%%    \
 % %%.%% % %%    %    \
 % %...     o    %    \
 % %% %%%  %%%%%%%    \
 %    % %%%%          \
 %%%%%%               \
/; b endmap
}
  /^87$/{s/.*/\
SED Sokoban - LEVEL 87\
\
     %%%%%            \
  %%%%   %% %%%%%     \
  %  o    %%%   %     \
  % o@o o    o  %     \
  % %o%%%%%%%% %%     \
  % %  o  %     %     \
  % % o o % %   %     \
 %% %  o% % %%%%%     \
 %  %%    %     %     \
 %    o % %%%   %     \
 %%%%% %%  %....%     \
 %    o     ....%     \
 %         %....%     \
 %%%%%%%%%%%%%%%%     \
/; b endmap
}
  /^88$/{s/.*/\
SED Sokoban - LEVEL 88\
\
 %%%%%%%%%%%%%        \
 %........%%%%        \
 %...%%%% %  %%%%%    \
 %...%  %%%    o %    \
 %...oo     o o  %    \
 %  .%  o o% o  %%    \
 %...% %o%   o  %     \
 %.% % o   o    %     \
 %.  %o%%%o%%%%o%     \
 %%  %   o o    %     \
  %  %  o@o  %  %     \
  %  % %%%% o  o%     \
  %  %    %%%   %     \
  %  % oo % %%%%%     \
  %  %    %           \
  %%%%%%%%%           \
/; b endmap
}
  /^89$/{s/.*/\
SED Sokoban - LEVEL 89\
\
  %%%%%%%%%%%%%%%%%%  \
  %   o       ...%.%% \
  %       %%%%..... % \
  % %%%%%%%  %..... % \
  % %    o o %%....%% \
  % %  o % % %%%...%  \
  % % o@o o  %%%%% %  \
 %% %  o  o oo   o %  \
 %  %o% o%   % o%% %  \
 % %%    %% %% o % %  \
 % % o% o o  %     %  \
 % %         %%%%%%%  \
 % %%%%%%%%o%%   %    \
 %        %  o   %    \
 %%%%%%%%    %%%%%    \
        %%%  %        \
          %%%%        \
/; b endmap
}
  /^90$/{s/.*/\
SED Sokoban - LEVEL 90\
\
 %%%%%%%%%%%%%%%%%%%% \
 %..%    %          % \
 %.o  o  %oo  o%% o%% \
 %.o%  %%%  %% %%   % \
 %  % o %  oo   o   % \
 % %%%  % %  %o  %%%% \
 %  %% % o   %@ %   % \
 % o    o  %%.%%  o % \
 %  % o% o% o     %%% \
 %  %  %  %   %%%   % \
 %  %%%%%%%% %      % \
 %           %  %.%.% \
 %%o%%%%%%%%o%   ...% \
 %    .O  %    %%.%.% \
 % .O...O   o  .....% \
 %%%%%%%%%%%%%%%%%%%% \
                      \
/; b endmap
}
/SED Soko/!{s/.*/there is no '&' level!/p;q;}

:endmap
#r back to line 1 col 1
s/^/[H/
s,\(\n\)$,\1\1[ h j k l :q :r :z :gN ],
x
/:p /!s/.*//
b ini


:zero

#r supporting arrow keys also
//{
  s/\[A/k/g
  s/\[B/j/g
  s/\[C/l/g
  s/\[D/h/g
}

#r command aliases
s//:z/g

#r lowercase commands
y/HJKLQGZR/hjklqgzr/

#r wipe trash
s/[^hjklqgzr:0-9]//g

#r commands!
/^:/{
  #r quit
  /^:q/q

  #r refresh screen
  /^:z/{ s/.*/[2J/p; s/.*/:p [refresh]/; b ini
  }
  #r goto level N (optional g)
  /^:g\?\([0-9]\+\)$/{
    s//\1/; h; x; s/.*/:p [goto level &]/; x; b loadmap
  }
  #r restarting level
  /^:r/{ s/.*/:p [restart]/; x;
         s/.*LEVEL \([0-9]\+\).*/\1/; b loadmap
  }
}

#r welcome message
1 b welcome

#r first map loading
2 b loadmap


#r here the party begins
:ini

#r print message
#r TODO make it right
/^:p /{
  s/.*//
#r s//last command: /; s/$/       /p; d
}


#r empty command, jump to end
/./!{x;bx;}


#r -------------[ LEFT ]--------------------------

/^h/{

#r del current move and save others
  s///;x

#r clear path
  / @/{s//@ /;bx;}
#r push load
  / o@/{s//o@ /;bx;}

#r enter overdot
  /\.@/{s//! /;bx;}
#r continue overdot
  /\.!/{s//!./;bx;}
#r out overdot
  / !/{s//@./;bx;}

#r enter load overdot
  /\.o@/{s//O@ /;bx;}
#r enter overdot with load
  /\.O@/{s//O! /;bx;}
#r continue overdot with load
  /\.O!/{s//O!./;bx;}
#r out load overdot / enter overdot
  / O@/{s//o! /;bx;}
#r out load overdot / continue overdot
  / O!/{s//o!./;bx;}
#r out overdot with load
  / o!/{s//o@./;bx;}
#r out overdot with load / enter overdot
  /\.o!/{s//O@./;bx;}

#r can't pass
  bx

}


#r -------------[ RIGHT ]-------------------------

/^l/{

#r del current move and save others
  s///;x

#r clear path
  /@ /{s// @/;bx;}
#r push load
  /@o /{s// @o/;bx;}

#r enter overdot
  /@\./{s// !/;bx;}
#r continue overdot
  /!\./{s//.!/;bx;}
#r out overdot
  /! /{s//.@/;bx;}

#r enter load overdot
  /@o\./{s// @O/;bx;}
#r enter overdot with load
  /@O\./{s// !O/;bx;}
#r continue overdot with load
  /!O\./{s//.!O/;bx;}
#r out load overdot / enter overdot
  /@O /{s// !o/;bx;}
#r out load overdot / continue overdot
  /!O /{s//.!o/;bx;}
#r out overdot with load
  /!o /{s//.@o/;bx;}
#r out overdot with load / enter overdot
  /!o\./{s//.@O/;bx;}

#r can't pass
  bx
}


#r -------------[ DOWN ]--------------------------

/^j/{

#r del current move and save others
  s///;x

#r clear path
  /@\(.\{22\}\) /{s// \1@/;bx;}
#r push load
  /@\(.\{22\}\)o\(.\{22\}\) /{s// \1@\2o/;bx;}

#r enter overdot
  /@\(.\{22\}\)\./{s// \1!/;bx;}
#r continue overdot
  /!\(.\{22\}\)\./{s//.\1!/;bx;}
#r out overdot
  /!\(.\{22\}\) /{s//.\1@/;bx;}

#r enter load overdot
  /@\(.\{22\}\)o\(.\{22\}\)\./{s// \1@\2O/;bx;}
#r enter overdot with load
  /@\(.\{22\}\)O\(.\{22\}\)\./{s// \1!\2O/;bx;}
#r continue overdot with load
  /!\(.\{22\}\)O\(.\{22\}\)\./{s//.\1!\2O/;bx;}
#r out load overdot / enter overdot
  /@\(.\{22\}\)O\(.\{22\}\) /{s// \1!\2o/;bx;}
#r out load overdot / continue overdot
  /!\(.\{22\}\)O\(.\{22\}\) /{s//.\1!\2o/;bx;}
#r out overdot with load
  /!\(.\{22\}\)o\(.\{22\}\) /{s//.\1@\2o/;bx;}
#r out overdot with load / enter overdot
  /!\(.\{22\}\)o\(.\{22\}\)\./{s//.\1@\2O/;bx;}

#r target not free
  bx
}


#r ---------------[ UP ]--------------------------

/^k/{

#r del current move and save others
  s///;x

#r clear path
  / \(.\{22\}\)@/{s//@\1 /;bx;}
#r push load
  / \(.\{22\}\)o\(.\{22\}\)@/{s//o\1@\2 /;bx;}

#r enter overdot
  /\.\(.\{22\}\)@/{s//!\1 /;bx;}
#r continue overdot
  /\.\(.\{22\}\)!/{s//!\1./;bx;}
#r out overdot
  / \(.\{22\}\)!/{s//@\1./;bx;}

#r enter load overdot
  /\.\(.\{22\}\)o\(.\{22\}\)@/{s//O\1@\2 /;bx;}
#r enter overdot with load
  /\.\(.\{22\}\)O\(.\{22\}\)@/{s//O\1!\2 /;bx;}
#r continue overdot with load
  /\.\(.\{22\}\)O\(.\{22\}\)!/{s//O\1!\2./;bx;}
#r out load overdot / enter overdot
  / \(.\{22\}\)O\(.\{22\}\)@/{s//o\1!\2 /;bx;}
#r out load overdot / continue overdot
  / \(.\{22\}\)O\(.\{22\}\)!/{s//o\1!\2./;bx;}
#r out overdot with load
  / \(.\{22\}\)o\(.\{22\}\)!/{s//o\1@\2./;bx;}
#r out overdot with load / enter overdot
  /\.\(.\{22\}\)o\(.\{22\}\)!/{s//O\1@\2./;bx;}

#r target not free
  bx
}

#r wrong command, do nothing
s/^.// ; x


#r ----------------[ THE END ]-----------------
:x

#r adding color codes
s/%/[46;36m&[m/g
s/[!@]/[33;1m&[m/g
s/O/[37;1m&[m/g
s/\./[31;1m&[m/g


#r uncomment this line if you DON'T want colorized output (why not?)
### s/\[[0-9;]*m//g

#r update screen
p

#r removing color codes from maze
s/\[[0-9;]*m//g

#r no more load ('o'), level finished!
/[ @!%.]o\|o[ @!%.]/!{
  s/.*/[37;01m(( [31mV[32mI[33mC[34mT/
  s/$/[31mO[32mR[33mY[34m![37m ))[m/
  s/$/                             /
  #r uncomment here if you DON'T want color or sound on victory
  #r s///g ; s/\[[0-9;]*m//g
  p;i\
  You're a master of this level. Try the next!
  q
}

#r save current position on hold space
x

#r skipping loop
2d

#r nice loop for accumulated moves
/./{p;bini;}

