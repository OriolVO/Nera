#!/bin/bash

# run_tests.sh
# Executes all test cases in the tests/ directory and verifies compilation/execution.

GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

PASSED=0
FAILED=0
TOTAL=0

echo -e "${YELLOW}Starting Nera Compiler Test Suite...${NC}\n"

for file in tests/*.nera; do
    # Skip if no .nera files are found
    [ -e "$file" ] || continue

    filename=$(basename "$file")
    TOTAL=$((TOTAL + 1))

    echo -n "Running $filename... "

    # Check if this test is expected to fail
    if [[ "$filename" == "test_errors.nera" || "$filename" == "test_invalid.nera" ]]; then
        output=$(cargo run -q -- compile "$file" 2>&1)
        if [ $? -ne 0 ]; then
            echo -e "${GREEN}PASSED (Expected failure)${NC}"
            PASSED=$((PASSED + 1))
        else
            echo -e "${RED}FAILED (Expected failure but it compiled)${NC}"
            FAILED=$((FAILED + 1))
        fi
    else
        # For all other tests, we expect them to compile and run successfully
        output=$(cargo run -q -- run "$file" 2>&1)
        if [ $? -eq 0 ]; then
            echo -e "${GREEN}PASSED${NC}"
            PASSED=$((PASSED + 1))
        else
            echo -e "${RED}FAILED${NC}"
            echo -e "\n--- Error Output ---"
            echo "$output"
            echo "--------------------"
            FAILED=$((FAILED + 1))
        fi
    fi
done

echo -e "\n${YELLOW}=== Test Summary ===${NC}"
echo -e "Total:  $TOTAL"
echo -e "Passed: ${GREEN}$PASSED${NC}"
echo -e "Failed: ${RED}$FAILED${NC}"

if [ $FAILED -gt 0 ]; then
    exit 1
else
    exit 0
fi
