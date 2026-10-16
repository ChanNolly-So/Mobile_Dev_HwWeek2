class BankAccount {
    // TODO
  String accountId;
  String accountHolder;
  double balance;

    BankAccount(this.accountId, this.accountHolder, this.balance);
    double getBalance() {
        return balance;
    }
    void credit(double amount) {
        balance += amount;
    }
    void withdraw(double amount) {
     if (amount > balance) {
        throw Exception('Insufficient balance for withdrawal');
      }
      balance -= amount;
    }
}

class Bank {
    // TODO
  String name;
  Map < String, BankAccount> accounts = {};

    Bank({required this.name});
    BankAccount createAccount(String accountId, String accountOwner) {
  
    for (BankAccount acc in accounts.values) {
      if (acc.accountId == accountId) {
        throw Exception('Account with ID $accountId already exists!');
      }
    }
   BankAccount newAccount =
        BankAccount(accountId, accountOwner, 0);

    accounts[accountId] = newAccount;

    return newAccount;
  }
}
 
void main() {

  Bank myBank = Bank(name: "CADT Bank");
  BankAccount ronanAccount = myBank.createAccount('100', 'Ronan');

  print(ronanAccount.balance); // Balance: $0
  ronanAccount.credit(100);
  print(ronanAccount.balance); // Balance: $100
  ronanAccount.withdraw(50);
  print(ronanAccount.balance); // Balance: $50

  try {
    ronanAccount.withdraw(75); // This will throw an exception
  } catch (e) {
    print(e); // Output: Insufficient balance for withdrawal!
  }

  try {
    myBank.createAccount('100', 'Honlgy'); // This will throw an exception
  } catch (e) {
    print(e); // Output: Account with ID 100 already exists!
  }
}
