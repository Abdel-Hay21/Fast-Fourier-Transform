import fft_pkg::*;
class generator;

int loop = 100;
event drv_done;
mailbox drv_mbx;



task run();
integer fd; 
transaction item;

fd = $fopen("fft_inputs.txt", "r");

/*item = new;
item.nRESET = 0;
drv_mbx.put(item);
@(drv_done);*/

for(int i=-1; i < loop+6; i++)
begin
    transaction item = new;
    if(i==-1 || i==103 || i==105)
    begin
       item.nRESET = 0;
       item.ENABLE = 0;
       for (int j=0; j<8 ; j++)
           item.signal_in_time[j] = 0;
       drv_mbx.put(item);
       @(drv_done);
       continue;
    end

    if(i==104)
    begin
        item.nRESET = 1;
        item.ENABLE = 1;
        for (int j=0; j<8 ; j++)
            item.signal_in_time[j] = 0;
        drv_mbx.put(item);
        @(drv_done);
       continue;
    end
    
    else
    begin
        for (int j=0; j<8 ; j++)
        begin
            $fscanf(fd, "%b", item.signal_in_time[j]);
        end
        item.nRESET = 1;
        item.ENABLE = 1;
        drv_mbx.put(item);
        @(drv_done);
       continue;
    end


end
$fclose(fd);
endtask

endclass