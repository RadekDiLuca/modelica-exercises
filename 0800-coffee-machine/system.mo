class System

Customer c1;   /// customer
CoffeeMachine m1;   /// server input queue


equation


connect(c1.Customer2Machine, m1.Customer2Machine);
connect(c1.Machine2Customer, m1.Machine2Customer);

end System;
