/*
 * TwentyFortyEight.c : Camillo J. Taylor - Sept. 23, 2014
 */

#include "lc4libc.h"


/*
 * #############  DATA STRUCTURES THAT STORE THE GAME STATE ######################
 */

// The game state is encoded in this 4x4 array where tile[0][0] corresponds to the upper left tile, tile[0][1] is the tile
// immediately to its right and tile[1][0] is the tile immediately below etc. etc. The legal entries are 0, 2, 4, 8, 16 etc
// where 0 corresponds to an empty spot.

int tile[4][4];

int score;

/*
 * #############  HELPER FUNCTIONS ######################
 */


//
// routine for printing out 2C 16 bit numbers in LC4
//
void printnum (int n) {
  int abs_n;
  char str[10], *ptr;

  // Corner case (n == 0)
  if (n == 0) {
    lc4_puts ((lc4uint*)"0");
    return;
  }
 
  abs_n = (n < 0) ? -n : n;

  // Corner case (n == -32768) no corresponding +ve value
  if (abs_n < 0) {
    lc4_puts ((lc4uint*)"-32768");
    return;
  }

  ptr = str + 10; // beyond last character in string

  *(--ptr) = 0; // null termination

  while (abs_n) {
    *(--ptr) = (abs_n % 10) + 48; // generate ascii code for digit
    abs_n /= 10;
  }

  // Handle -ve numbers by adding - sign
  if (n < 0) *(--ptr) = '-';

  lc4_puts((lc4uint*)ptr);
}

void endl () {
  lc4_puts((lc4uint*)"\n");
}

// rand16 returns a pseudo-random number between 0 and 15 by simulating the action of a 16 bit Linear Feedback Shift Register.
int rand16 ()
{
  int lfsr;

  // Advance the lfsr four times
  lfsr = lc4_lfsr();
  lfsr = lc4_lfsr();
  lfsr = lc4_lfsr();
  lfsr = lc4_lfsr();

  // return the last 4 bits
  return (lfsr & 0xF);
}

/*
 * #############  CODE THAT DRAWS THE SCENE ######################
 */


// COLOR_2 : BLUE - 0 00000 00000 11111
#define COLOR_2       0x001FU

// COLOR_2 : GREEN - 0 000001 1 111 0 0000
#define COLOR_4       0x03E0U

// COLOR_8 :      - 0 00000 11 111 1 1111
#define COLOR_8       0x03FFU

// COLOR_16 :      - 0 111 11 11 111 0 0000 
#define COLOR_16      0x7FE0U

// COLOR_32 :      - 0 111 11 00 000 1 1111
#define COLOR_32      0x7C1FU

// COLOR_64 :      - 0 111 11 00 000 1 0000
#define COLOR_64      0x07C10U

// COLOR_128 :      - 0 100 00 00 000 1 1111
#define COLOR_128     0x401FU

// COLOR_256 :      - 0 111 11 10 000 1 1111
#define COLOR_256     0x7E1FU

// COLOR_512 :      - 0 100 00 00 000 1 1111
#define COLOR_512     0x401FU

// COLOR_1024 :    - 0 111 11 10 000 0 0000
#define COLOR_1024    0x7E00U

// COLOR_2048 : RED - 0 11111 00000 00000
#define COLOR_2048    0x7C00U


void drawTiles () {
  int i;

  for (i = 0; i < 16; i++) {

    if (tile[i / 4][i % 4] < 33) {
      drawSmall(tile[i / 4][i % 4], i / 4 * 31 + 3, i % 4 * 31 + 1);
    } else {
      drawBig(tile[i / 4][i % 4], i / 4 * 31 + 3, i % 4 * 31 + 1);
    }

  }

}

void redraw ()
{
  // This function assumes that PennSim is being run in double buffered mode
  // In this mode we first clear the video memory buffer with lc4_reset_vmem,
  // then draw the scene, then call lc4_blt_vmem to swap the buffer to the screen
  // NOTE that you need to run PennSim with the following command:
  // java -jar PennSim.jar -d

  lc4_reset_vmem();

  drawTiles ();

  lc4_blt_vmem();
}

void add_tile() {
  int i, j, free_tiles, new_tile, value, lost;
  
  free_tiles = 0;

  for (i = 0; i < 16; i++) {
    
    if (tile[i / 4][i % 4] == 0) {
      free_tiles++;
    }

  }

  if (free_tiles > 0) {
    new_tile = rand16() % free_tiles;
    value = (rand16() % 8 == 0) ? 4 : 2;
    score += value;
    lc4_puts ((lc4uint*)"Current score is ");
    printnum(score);
    lc4_puts ((lc4uint*)"\n");
    free_tiles = -1;

    for (i = 0; i < 16; i++) {
    
      if (tile[i / 4][i % 4] == 0) {
        free_tiles++;

        if (free_tiles == new_tile) {
          tile[i / 4][i % 4] = value;
          break;
        }

      }

    }

  }

  // checking loss condition
  lost = 1;

  for (i = 0; i < 4; i++) {

    for (j = 0; j < 4; j++) {

      if (tile[i][j] == 0) {
        lost = 0;
        break;
      }

      if (j < 3) {
          
        if (tile[i][j] == tile[i][j + 1]) {
          lost = 0;
          break;
        }

      }

      if (i < 3) {
          
        if (tile[i][j] == tile[i + 1][j]) {
          lost = 0;
          break;
        }

      }

    }

    if (lost == 0) {
      break;
    }

  }

  if (lost == 1) {
    lc4_puts ((lc4uint*)"Unfortunately, you lost. Your score is ");
    printnum(score);
    lc4_puts ((lc4uint*)"\n");
  };

}

void drawSmall(int value, lc4int x, lc4int y) {

  if (value == 2) {
    lc4_draw_rect(x, y, 29, 29, COLOR_2);
    lc4_draw_seven_seg(x + 12, y + 9, 0x00000, 0x5D);
  } else if (value == 4) {
    lc4_draw_rect(x, y, 29, 29, COLOR_4);
    lc4_draw_seven_seg(x + 12, y + 9, 0x00000, 0x2E);
  } else if (value == 8) {
    lc4_draw_rect(x, y, 29, 29, COLOR_8);
    lc4_draw_seven_seg(x + 12, y + 9, 0x00000, 0x7F);
  } else if (value == 16) {
    lc4_draw_rect(x, y, 29, 29, COLOR_16);
    lc4_draw_seven_seg(x + 8, y + 9, 0x00000, 0x24);
    lc4_draw_seven_seg(x + 15, y + 9, 0x00000, 0x7B);
  } else if (value == 32) {
    lc4_draw_rect(x, y, 29, 29, COLOR_32);
    lc4_draw_seven_seg(x + 8, y + 9, 0x00000, 0x6D);
    lc4_draw_seven_seg(x + 15, y + 9, 0x00000, 0x5D);
  }

}

void drawBig(int value, lc4int x, lc4int y) {

  if (value == 64) {
    lc4_draw_rect(x, y, 29, 29, COLOR_64);
    lc4_draw_seven_seg(x + 8, y + 9, 0x00000, 0x7B);
    lc4_draw_seven_seg(x + 15, y + 9, 0x00000, 0x2E);
  } else if (value == 128) {
    lc4_draw_rect(x, y, 29, 29, COLOR_128);
    lc4_draw_seven_seg(x + 5, y + 9, 0x00000, 0x24);
    lc4_draw_seven_seg(x + 12, y + 9, 0x00000, 0x5D);
    lc4_draw_seven_seg(x + 19, y + 9, 0x00000, 0x7F);
  } else if (value == 256) {
    lc4_draw_rect(x, y, 29, 29, COLOR_256);
    lc4_draw_seven_seg(x + 5, y + 9, 0x00000, 0x5D);
    lc4_draw_seven_seg(x + 12, y + 9, 0x00000, 0x6B);
    lc4_draw_seven_seg(x + 19, y + 9, 0x00000, 0x7B);
  } else if (value == 512) {
    lc4_draw_rect(x, y, 29, 29, COLOR_512);
    lc4_draw_seven_seg(x + 5, y + 9, 0x00000, 0x6B);
    lc4_draw_seven_seg(x + 12, y + 9, 0x00000, 0x24);
    lc4_draw_seven_seg(x + 19, y + 9, 0x00000, 0x5D);
  } else if (value == 1024) {
    lc4_draw_rect(x, y, 29, 29, COLOR_1024);
    lc4_draw_seven_seg(x + 1, y + 9, 0x00000, 0x24);
    lc4_draw_seven_seg(x + 8, y + 9, 0x00000, 0x77);
    lc4_draw_seven_seg(x + 15, y + 9, 0x00000, 0x5D);
    lc4_draw_seven_seg(x + 22, y + 9, 0x00000, 0x2E);
  } else if (value == 2048) {
    lc4_draw_rect(x, y, 29, 29, COLOR_2048);
    lc4_draw_seven_seg(x + 1, y + 9, 0x00000, 0x5D);
    lc4_draw_seven_seg(x + 8, y + 9, 0x00000, 0x77);
    lc4_draw_seven_seg(x + 15, y + 9, 0x00000, 0x2E);
    lc4_draw_seven_seg(x + 22, y + 9, 0x00000, 0x7F);
  }

}

/*
 * #############  CODE THAT HANDLES GAME PLAY ######################
 */


void reset_game_state () {
  int i;

  score = 0;

  for (i = 0; i < 16; i++) {
    tile[i / 4][i % 4] = 0;
  }

  add_tile();
  add_tile();
}

// basic routine to merge four tile values
void mergeTiles (int *a) {
  int left, right, i, rest_is_zeros;
  
  left = 0;
  right = 1;

  do {
    
    if (a[left] == 0) {
      
      rest_is_zeros = 1;

      for (i = left; i < 4; i++) {
        
        if (a[i] != 0) {
          rest_is_zeros = 0;
          break;
        }

      };

      if (rest_is_zeros == 1) {
        return;
      }

      for (i = left; i < 4; i++) {
        a[i] = a[i + 1];
      }

    } else if (a[right] == 0) {
      rest_is_zeros = 1;

      for (i = right; i < 4; i++) {
        
        if (a[i] != 0) {
          rest_is_zeros = 0;
          break;
        }

      };

      if (rest_is_zeros == 1) {
        return;
      };

      for (i = right; i < 4; i++) {
        a[i] = a[i + 1];
      };

    } else {

      if (a[left] == a[right]) {
        a[left] = a[left]*2;
        a[right] = 0;

        if (a[left] == 2048) {
          lc4_puts ((lc4uint*)"Congratulations! You won and your score is ");
          printnum(score);
          lc4_puts ((lc4uint*)"\n");
        }

      };

      left = right;
      right = left + 1;
    }

  } while (right < 4);

}

void update_game_state (lc4uint key) {
  int merge[5];
  int i, j, updated;

  updated = 0;
  merge[4] = 0;

  if (key == 113) {
    reset_game_state();
  } else if (key == 105) {

    for (i = 0; i < 4; i++) {

      for (j = 0; j < 4; j++) {
        merge[j] = tile[i][j];
      }

      mergeTiles(&merge[0]);

      for (j = 0; j < 4; j++) {

        if (tile[i][j] != merge[j]) {
          updated = 1;
        }

        tile[i][j] = merge[j];
      }

    }

  } else if (key == 107) {

    for (i = 0; i < 4; i++) {

      for (j = 0; j < 4; j++) {
        merge[j] = tile[i][3 - j];
      }

      mergeTiles(&merge[0]);

      for (j = 0; j < 4; j++) {

        if (tile[i][3 - j] != merge[j]) {
          updated = 1;
        }

        tile[i][3 - j] = merge[j];
      }

    }

  } else if (key == 106) {

    for (i = 0; i < 4; i++) {

      for (j = 0; j < 4; j++) {
        merge[j] = tile[j][i];
      }

      mergeTiles(&merge[0]);

      for (j = 0; j < 4; j++) {
        
        if (tile[j][i] != merge[j]) {
          updated = 1;
        }

        tile[j][i] = merge[j];
      }

    }

  } else if (key == 108) {

    for (i = 0; i < 4; i++) {

      for (j = 0; j < 4; j++) {
        merge[j] = tile[3 - j][i];
      }

      mergeTiles(&merge[0]);

      for (j = 0; j < 4; j++) {

        if (tile[3 - j][i] != merge[j]) {
          updated = 1;
        }

        tile[3 - j][i] = merge[j];
      }

    }

  }
  
  if (updated == 1) {
    add_tile();
  }

}

/*
 * #############  MAIN PROGRAM ######################
 */

int main ()
{
  lc4uint key;

  lc4_puts ((lc4uint*)"!!! Welcome to 2048 !!!\n");
  lc4_puts ((lc4uint*)"Press i to slide up\n");
  lc4_puts ((lc4uint*)"Press k to slide down\n");
  lc4_puts ((lc4uint*)"Press j to slide left\n");
  lc4_puts ((lc4uint*)"Press l to slide right\n");
  lc4_puts ((lc4uint*)"Press q to reset\n");

  reset_game_state();

  redraw ();

  while (1) {
    key = lc4_wait_for_char();

    lc4_puts ((lc4uint*)"Got a keystroke\n");

    update_game_state(key);

    redraw ();
  }

  return 0;
}
