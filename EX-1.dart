enum Skill { FLUTTER, DART, OTHER }

class Employee {
  String _name;
  double _baseSalary;
  List <Skill>_skills = [];
  Address? _address;
  int _yearOfExperience;

  Employee(this._name, this._baseSalary,[this._address, this._yearOfExperience=0]);
  Employee.mobileDevelper(this._name, this._baseSalary,this._address,this._yearOfExperience):_skills = [Skill.FLUTTER, Skill.DART];

String get name => _name;
double get baseSalary => _baseSalary;
List<Skill> get skills => _skills;
Address? get address => _address;
int get yearOfExperience => _yearOfExperience;
  void printDetails() {
  print('Employee: $name');
  print('Base Salary: \$${baseSalary}');
  print('Year of Experience: $_yearOfExperience');

  double totalSalary = computeSalary(
      name, baseSalary, skills, yearOfExperience);

  print('Total Salary: \$${totalSalary}');
}

  double computeSalary(String name, double baseSalary, List <Skill> skills, int yearOfExperience) {
    double totalSalary = baseSalary;

totalSalary += yearOfExperience * 2000;
    
    for (var skill in skills) {
      if (skill == Skill.FLUTTER) {
        totalSalary += 5000;
      } else if (skill == Skill.DART) {
        totalSalary += 3000;
      } else if (skill == Skill.OTHER) {
        totalSalary += 1000;
      }
    }

    return totalSalary;
  }
}
class Address {
  String street;
  String city;
  String zipCode;

  Address (this.street,this.city,this.zipCode);

}

void main() {
  var emp1 = Employee('Sokea', 40000,null,3);
  emp1.printDetails();

  var emp2 = Employee('Ronan', 45000);
  emp2.printDetails();
}