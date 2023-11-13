#include <bits/stdc++.h>
using namespace std;

bool invalid = false;

bool isNumber(char x)
{
    return ('0' <= x && x <= '9');
}

bool isOperation(char x)
{
    return (x == '+' || x == '-' || x == '*' || x == '/');
}

bool isGreater(char op1, char op2)
{
    if (op1 == '/' || op1 == '*')
    {
        return true;
    }
    if (op1 == '+' || op1 == '-')
    {
        if (op2 == '+' || op2 == '-')
            return true;
        return false;
    }
    return false;
}

string numToStr(int num){
    string ret = "";
    if(num == 0) return "0";
    while(num > 0){
        ret += '0' + num%10;
        num /= 10;
    }
    reverse(ret.begin(), ret.end());
    return ret;
}

float calculate(float num1, float num2, char op)
{
    switch (op)
    {
    case '+':
        return num1 + num2;
        break;
    case '-':
        return num2 - num1;
        break;
    case '*':
        return num2 * num1;
        break;
    case '/':
        if(num1 == 0) {
            invalid = true;
            return -1;
        }
        return num2 / num1;
        break;
    default:
        break;
    }
    return 0;
}

float getAnswer(string &expression){
    invalid = false;
    float finalAnswer = 0;
    stack<float> operandSt;
    stack<char> operationSt;
    int n = expression.size();
    bool wasOperation = true;
    for (int i = 0; i < n; i++)
    {
        float num = 0;
        bool isNum = false;
        bool isNeg = false;
        if(wasOperation){
            if(expression[i] == '-') {
                isNeg = true;
                i++;
            }
            wasOperation = false;
        }
        else{
            wasOperation = true;
        }
        int j = i;
        while (isNumber(expression[j]))
        {
            num *= 10;
            num += (expression[j] - '0');
            isNum = true;
            i = j;
            j++;
        };
        if (isNum)
        {
            if(isNeg) num = -num;
            operandSt.push(num);
        }
        else
        {
            // operation
            if (operationSt.empty())
            {
                operationSt.push(expression[i]);
            }
            else
            {
                while (!operationSt.empty() && isGreater(operationSt.top(), expression[i]))
                {
                    char operation = operationSt.top();
                    operationSt.pop();
                    float num1 = operandSt.top();
                    operandSt.pop();
                    float num2 = operandSt.top();
                    operandSt.pop();
                    float result = calculate(num1, num2, operation);
                    if(invalid){
                        cout << "Invalid command \n";
                        break;
                    }
                    operandSt.push(result);
                }
                operationSt.push(expression[i]);
            }
        }
        if(invalid) break;
    }
    if(invalid){
        return -1;
    }
    while (!operationSt.empty())
    {
        char operation = operationSt.top();
        operationSt.pop();
        float num1 = operandSt.top();
        operandSt.pop();
        float num2 = operandSt.top();
        operandSt.pop();
        float result = calculate(num1, num2, operation);
        if(invalid){
            cout << "Invalid command \n";
            break;
        }
        operandSt.push(result);
    }
    if(invalid){
        return -1;
    }
    finalAnswer = operandSt.top();
    return finalAnswer;
}

float evaluateExpression(string &expression){
    int numExpr = count(expression.begin(), expression.end(), ';');
    map<char, float> varToNum;
    int n = expression.size();
    int i = 0;
    for(; i < n; i++){
        if(expression[i] == ';') continue;
        if(numExpr == 0) break;
        char varName = expression[i];
        i += 2;
        float num = 0;
        int j = i;
        while (isNumber(expression[j]))
        {
            num *= 10;
            num += (expression[j] - '0');
            i = j;
            j++;
        }
        numExpr --;
        varToNum[varName] = num;
    }

    string finalExpr = "";
    for(; i < n; i++){
        if(varToNum.find(expression[i]) != varToNum.end()){
            finalExpr += numToStr(varToNum[expression[i]]);
        }
        else{
            finalExpr += expression[i];
        }
    }
    float answer = getAnswer(finalExpr);
    if(invalid) return -1;
    return answer;
}

int main()
{
    string expression;
    while (getline(cin, expression))
    {
        float finalAns = evaluateExpression(expression);
        if(invalid) continue;
        cout << finalAns << endl;
    }
}