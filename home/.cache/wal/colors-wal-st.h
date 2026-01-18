const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#06060E", /* black   */
  [1] = "#0956DF", /* red     */
  [2] = "#936DB3", /* green   */
  [3] = "#628AC2", /* yellow  */
  [4] = "#A3A2DA", /* blue    */
  [5] = "#B5ADE2", /* magenta */
  [6] = "#D2D3FB", /* cyan    */
  [7] = "#e3e8f5", /* white   */

  /* 8 bright colors */
  [8]  = "#9ea2ab",  /* black   */
  [9]  = "#0956DF",  /* red     */
  [10] = "#936DB3", /* green   */
  [11] = "#628AC2", /* yellow  */
  [12] = "#A3A2DA", /* blue    */
  [13] = "#B5ADE2", /* magenta */
  [14] = "#D2D3FB", /* cyan    */
  [15] = "#e3e8f5", /* white   */

  /* special colors */
  [256] = "#06060E", /* background */
  [257] = "#e3e8f5", /* foreground */
  [258] = "#e3e8f5",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
