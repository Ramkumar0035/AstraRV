`timescale 1ns/1ps

module astrarv_single_cycle_cpu_tb;

    //---------------------------------------
    // Signals
    //---------------------------------------

    logic i_clk;
    logic i_rst_n;

    integer errors;

    //---------------------------------------
    // DUT
    //---------------------------------------

    astrarv_single_cycle_cpu dut (

        .i_clk(i_clk),
        .i_rst_n(i_rst_n)

    );

    //---------------------------------------
    // Clock Generation
    //---------------------------------------

    initial begin

        i_clk = 0;

        forever #5 i_clk = ~i_clk;

    end

    //---------------------------------------
    // Reset Generation
    //---------------------------------------

    initial begin

        i_rst_n = 0;

        #20;

        i_rst_n = 1;

    end

    //---------------------------------------
    // Register Check Task
    //---------------------------------------

    task automatic check_reg;

        input integer reg_num;
        input [31:0] expected;

        begin

            if(dut.u_regfile.registers[reg_num] == expected)

                $display("PASS : x%0d = %0d",
                          reg_num,
                          expected);

            else begin

                $display("FAIL : x%0d Expected=%0d Got=%0d",
                          reg_num,
                          expected,
                          dut.u_regfile.registers[reg_num]);

                errors = errors + 1;

            end

        end

    endtask

    //---------------------------------------
    // Memory Check Task
    //---------------------------------------

    task automatic check_mem;

        input integer addr;
        input [31:0] expected;

        begin

            if(dut.u_dmem.mem[addr] == expected)

                $display("PASS : MEM[%0d] = %0d",
                          addr,
                          expected);

            else begin

                $display("FAIL : MEM[%0d] Expected=%0d Got=%0d",
                          addr,
                          expected,
                          dut.u_dmem.mem[addr]);

                errors = errors + 1;

            end

        end

    endtask

    //---------------------------------------
    // Test Sequence
    //---------------------------------------

    initial begin

        errors = 0;

        //-----------------------------------
        // Wait for reset
        //-----------------------------------

        @(posedge i_rst_n);

        //-----------------------------------
        // Execute Program
        //-----------------------------------

        #300;

        //-----------------------------------
        // Register Checks
        //-----------------------------------

        // Change these depending on the IMEM program

        check_reg(1,32'd5);
        check_reg(2,32'd10);

        //-----------------------------------
        // Example Memory Check
        //-----------------------------------

        //check_mem(0,32'd15);

        //-----------------------------------
        // Summary
        //-----------------------------------

        $display("---------------------------------------");

        if(errors==0)

            $display("ALL TESTS PASSED");

        else

            $display("%0d TESTS FAILED",errors);

        $display("---------------------------------------");

        $finish;

    end

endmodule