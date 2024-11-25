Overview
This is a simple calculator program written in x86 assembly language that allows users to perform basic arithmetic operations such as addition, subtraction, multiplication, and modulus. The program prompts the user to input two operands and an operator, and then it displays the result.

Features
Addition (+)
Subtraction (-)
Multiplication (*)
Modulus (%)
How It Works
Operand Input: The program prompts the user to input two operands (one at a time). The user can enter single-digit values, and the program processes them.
Operator Input: After both operands are entered, the program asks the user to input an operator (+, -, *, or %).
Calculation: Based on the operator entered, the program performs the corresponding arithmetic operation:
Addition: Adds operand 2 to operand 1.
Subtraction: Subtracts operand 2 from operand 1.
Multiplication: Multiplies operand 1 by operand 2.
Modulus: Calculates the remainder of operand 1 divided by operand 2.
Result Display: The result is displayed one digit at a time in the console.



Assembly Program: Character Removal from String
Description:
This program prompts the user to input a string, then prompts for a character to remove from the string. It processes the string by removing all occurrences of the specified character and displays the modified string.

Features:
Prompts the user to input a string.
Prompts the user for a character to remove.
Removes all occurrences of the specified character from the string.
Displays the modified string.
How It Works:
The program first displays the prompt "myStr:" and waits for user input, storing the input string in arr1.
The program then asks for a character (displaying "ch:"), which is stored in al.
It compares each character in the input string with the specified character.
If a match is found, the character is skipped; otherwise, it is copied to a new array (arr2).
Finally, the program displays the modified string without the specified character.
Requirements:
DOS environment or emulator (e.g., DOSBox) to run the program.
How to Run:
Assemble the code using an assembler like MASM or TASM.
Link the program to create an executable.
Run the executable in a DOS-compatible environment or emulator.
Follow the prompts to input the string and the character to remove
