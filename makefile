OBJS = obj_dir
SRCS = src
FILES = top_tb.v top.v sequencer.v rom.v counter.v prescaler.v pwm.v
SFILES = $(addprefix $(SRCS)/,$(FILES))

.PHONY: clean sim

$(OBJS)/Vtop_tb: $(SFILES)
	verilator --binary src/top_tb.v -I$(SRCS) --trace-vcd

sim: $(OBJS)/Vtop_tb
	./$(OBJS)/Vtop_tb

clean:
	rm -r $(OBJS)

listing.txt: $(SFILES)
	cat $^ > listing.txt
