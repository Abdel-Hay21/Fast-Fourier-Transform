onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /FFT_tb/nRESET_tb
add wave -noupdate /FFT_tb/CLK_tb
add wave -noupdate /FFT_tb/DUT/link1/signal_in_time
add wave -noupdate /FFT_tb/ENABLE_tb
add wave -noupdate -childformat {{{/FFT_tb/DUT/link1/x_stage1_real[0]} -radix binary} {{/FFT_tb/DUT/link1/x_stage1_real[1]} -radix binary} {{/FFT_tb/DUT/link1/x_stage1_real[2]} -radix binary} {{/FFT_tb/DUT/link1/x_stage1_real[3]} -radix binary} {{/FFT_tb/DUT/link1/x_stage1_real[4]} -radix binary} {{/FFT_tb/DUT/link1/x_stage1_real[5]} -radix binary} {{/FFT_tb/DUT/link1/x_stage1_real[6]} -radix binary} {{/FFT_tb/DUT/link1/x_stage1_real[7]} -radix binary}} -expand -subitemconfig {{/FFT_tb/DUT/link1/x_stage1_real[0]} {-height 15 -radix binary} {/FFT_tb/DUT/link1/x_stage1_real[1]} {-height 15 -radix binary} {/FFT_tb/DUT/link1/x_stage1_real[2]} {-height 15 -radix binary} {/FFT_tb/DUT/link1/x_stage1_real[3]} {-height 15 -radix binary} {/FFT_tb/DUT/link1/x_stage1_real[4]} {-height 15 -radix binary} {/FFT_tb/DUT/link1/x_stage1_real[5]} {-height 15 -radix binary} {/FFT_tb/DUT/link1/x_stage1_real[6]} {-height 15 -radix binary} {/FFT_tb/DUT/link1/x_stage1_real[7]} {-height 15 -radix binary}} /FFT_tb/DUT/link1/x_stage1_real
add wave -noupdate /FFT_tb/DUT/link1/signal_temp1
add wave -noupdate /FFT_tb/DUT/link1/signal_temp3
add wave -noupdate -radix decimal -childformat {{{/FFT_tb/DUT/link1/x_stage1_image[0]} -radix binary} {{/FFT_tb/DUT/link1/x_stage1_image[1]} -radix binary} {{/FFT_tb/DUT/link1/x_stage1_image[2]} -radix binary} {{/FFT_tb/DUT/link1/x_stage1_image[3]} -radix binary} {{/FFT_tb/DUT/link1/x_stage1_image[4]} -radix binary} {{/FFT_tb/DUT/link1/x_stage1_image[5]} -radix binary} {{/FFT_tb/DUT/link1/x_stage1_image[6]} -radix binary} {{/FFT_tb/DUT/link1/x_stage1_image[7]} -radix binary}} -subitemconfig {{/FFT_tb/DUT/link1/x_stage1_image[0]} {-height 15 -radix binary} {/FFT_tb/DUT/link1/x_stage1_image[1]} {-height 15 -radix binary} {/FFT_tb/DUT/link1/x_stage1_image[2]} {-height 15 -radix binary} {/FFT_tb/DUT/link1/x_stage1_image[3]} {-height 15 -radix binary} {/FFT_tb/DUT/link1/x_stage1_image[4]} {-height 15 -radix binary} {/FFT_tb/DUT/link1/x_stage1_image[5]} {-height 15 -radix binary} {/FFT_tb/DUT/link1/x_stage1_image[6]} {-height 15 -radix binary} {/FFT_tb/DUT/link1/x_stage1_image[7]} {-height 15 -radix binary}} /FFT_tb/DUT/link1/x_stage1_image
add wave -noupdate /FFT_tb/DUT/link1/stage1_done
add wave -noupdate -childformat {{{/FFT_tb/DUT/link2/x_stage2_real[0]} -radix binary} {{/FFT_tb/DUT/link2/x_stage2_real[1]} -radix binary} {{/FFT_tb/DUT/link2/x_stage2_real[2]} -radix binary} {{/FFT_tb/DUT/link2/x_stage2_real[3]} -radix binary} {{/FFT_tb/DUT/link2/x_stage2_real[4]} -radix binary} {{/FFT_tb/DUT/link2/x_stage2_real[5]} -radix binary} {{/FFT_tb/DUT/link2/x_stage2_real[6]} -radix binary} {{/FFT_tb/DUT/link2/x_stage2_real[7]} -radix binary}} -subitemconfig {{/FFT_tb/DUT/link2/x_stage2_real[0]} {-height 15 -radix binary} {/FFT_tb/DUT/link2/x_stage2_real[1]} {-height 15 -radix binary} {/FFT_tb/DUT/link2/x_stage2_real[2]} {-height 15 -radix binary} {/FFT_tb/DUT/link2/x_stage2_real[3]} {-height 15 -radix binary} {/FFT_tb/DUT/link2/x_stage2_real[4]} {-height 15 -radix binary} {/FFT_tb/DUT/link2/x_stage2_real[5]} {-height 15 -radix binary} {/FFT_tb/DUT/link2/x_stage2_real[6]} {-height 15 -radix binary} {/FFT_tb/DUT/link2/x_stage2_real[7]} {-height 15 -radix binary}} /FFT_tb/DUT/link2/x_stage2_real
add wave -noupdate -childformat {{{/FFT_tb/DUT/link2/x_stage2_image[0]} -radix binary} {{/FFT_tb/DUT/link2/x_stage2_image[1]} -radix binary} {{/FFT_tb/DUT/link2/x_stage2_image[2]} -radix binary} {{/FFT_tb/DUT/link2/x_stage2_image[3]} -radix binary} {{/FFT_tb/DUT/link2/x_stage2_image[4]} -radix binary} {{/FFT_tb/DUT/link2/x_stage2_image[5]} -radix binary} {{/FFT_tb/DUT/link2/x_stage2_image[6]} -radix binary} {{/FFT_tb/DUT/link2/x_stage2_image[7]} -radix binary}} -subitemconfig {{/FFT_tb/DUT/link2/x_stage2_image[0]} {-height 15 -radix binary} {/FFT_tb/DUT/link2/x_stage2_image[1]} {-height 15 -radix binary} {/FFT_tb/DUT/link2/x_stage2_image[2]} {-height 15 -radix binary} {/FFT_tb/DUT/link2/x_stage2_image[3]} {-height 15 -radix binary} {/FFT_tb/DUT/link2/x_stage2_image[4]} {-height 15 -radix binary} {/FFT_tb/DUT/link2/x_stage2_image[5]} {-height 15 -radix binary} {/FFT_tb/DUT/link2/x_stage2_image[6]} {-height 15 -radix binary} {/FFT_tb/DUT/link2/x_stage2_image[7]} {-height 15 -radix binary}} /FFT_tb/DUT/link2/x_stage2_image
add wave -noupdate /FFT_tb/DUT/link2/stage2_done
add wave -noupdate /FFT_tb/DUT/link3/x_stage3_real
add wave -noupdate /FFT_tb/DUT/link3/x_stage3_image
add wave -noupdate /FFT_tb/DUT/link3/stage3_done
add wave -noupdate /FFT_tb/signal_in_frequency_real_tb
add wave -noupdate /FFT_tb/signal_in_frequency_image_tb
add wave -noupdate /FFT_tb/FFT_FINISH_tb
add wave -noupdate /FFT_tb/signal_in_freq_in_decimal_real
add wave -noupdate /FFT_tb/signal_in_freq_in_decimal_image
add wave -noupdate /FFT_tb/DUT/link1/signal_temp2
add wave -noupdate /FFT_tb/DUT/link1/signal_temp4
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {5 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 239
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {14 ps}
