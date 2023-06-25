# VendingMachineFPGA
Vending Machine Verilog HDL Code


If a quarter is inserted into the vending machine, the LED is logic 1, the machine adds 25 cen as credit. If the dollar bill goes to logic 1, the machine adds 100 cen (RM 1) as a credit. If the user presses the buy button, the machine first checks which product is selected. Then, it checks the total credit is enough and there is at least one product is available in stock. If all conditions are satisfied, then the vending machine withdraws the price of the product from total credit; decreases the stock of the product by one and sets the relevant bit of the product output to logic level. If the user wishes to refund any money leftover in the vending machine then the "refund" button should be pressed
