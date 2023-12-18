module pixel_gen(
  input [9:0] pixel_x,
  input [9:0] pixel_y,
  input clk_div,
  input start,
  input video_on,
  input [9:0] bird_x,
  input [9:0] bird_y,
  input [9:0] pipe1_x,
  input [9:0] pipe1y_up,
  input [9:0] pipe2_x,
  input [9:0] pipe2y_up,
  input [9:0] pipe3_x,
  input [9:0] pipe3y_up,
  output reg [3:0] red = 0,
  output reg [3:0] blue = 0,
  output reg [3:0] green = 0
);

  always @ (posedge clk_div or posedge start)
  begin
    if (start)
    begin
      // Initialization logic if needed
    end
    else
    begin
      if ((pixel_y >= bird_y && pixel_y <= (bird_y + 20)) && (pixel_x >= bird_x && pixel_x < (bird_x + 20)))
      // Drawing the bird
      begin
        red <= 4'hf;
        blue <= 4'h0;
        green <= 4'h0;
      end
      else if (((pixel_x >= pipe1_x && pixel_x < (pipe1_x + 40)) && ((pixel_y >= (pipe1y_up + 80) && pixel_y < 480) || (pixel_y >= 0 && pixel_y < pipe1y_up))) ||
               ((pixel_x >= pipe2_x && pixel_x < (pipe2_x + 40)) && ((pixel_y >= 0 && pixel_y < (pipe2y_up)) || (pixel_y >= (pipe2y_up + 80) && pixel_y < 480))) ||
               ((pixel_x >= pipe3_x && pixel_x < (pipe3_x + 40)) && ((pixel_y >= (pipe3y_up + 80) && pixel_y < 480) || (pixel_y >= 0 && pixel_y < (pipe3y_up)))))
      // Drawing the pipes
      begin
        red <= 4'h0;
        blue <= 4'h0;
        green <= 4'hf;
      end
      else
      // Painting the rest of the background black
      begin
        red <= video_on ? 4'h0 : 4'h0;
        green <= video_on ? 4'h0 : 4'h0;
        blue <= video_on ? 4'h0 : 4'h0;
      end
    end
  end
endmodule
