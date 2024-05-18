// SPDX-License-Indetifier: MTI
pragma solidity >=0.6.12 <0.9.0;

contract ErrorHandlingImproved {

    // Event to log when a specific condition is met
    event ConditionMet(string message, uint value);

    // Function using revert() with clear error message and potential data
    function revertOnSpecificValue(uint _num) public pure returns (uint) {
        if (_num == 1) {
            revert("Number cannot be one. Value provided: 1");  // Include specific data
        }
        return _num;
    }

    // Function using require() for upfront input validation with informative message
    function requireValidInput(uint _num) public pure returns (uint) {
        require(_num > 1, "Invalid input: Number must be greater than one.");
        return _num;
    }

    // Function using assert() only for internal assumptions with detailed message
    function assertInternalCondition(uint _num) public pure returns (uint) {
        uint result = _num * 2;

        // Use assert to ensure that result is greater than the input number.
        // This is an internal check that should always hold true if the logic is correct.
        assert(result > _num);

        // Log an event when the result is an even number greater than 2
        if (result % 2 == 0 && result > 2) {
            
        }

        return result;
    }

    // Additional function demonstrating the use of revert and require in combination
    function combinedErrorHandling(uint _num) public pure returns (uint) {
        // Validate input upfront
        require(_num > 0, "Input must be a positive number.");

        // Specific logic that may require reverting the transaction
        if (_num == 5) {
            revert("Number 5 is not allowed due to specific business logic.");
        }

        uint result = _num * 3;

        // Ensure the result follows a specific internal assumption
        assert(result >= _num);

        return result;
    }
}  
