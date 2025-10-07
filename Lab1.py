
def add(*args):
    if not args:
        return None
   
    if any(isinstance(arg, str) for arg in args):
        return ' '.join(str(arg) for arg in args)
  
    elif all(isinstance(arg, (int, float)) for arg in args):
        return sum(args)
    else:
        raise TypeError("Unsupported argument types.")

print(add(10, 20))        
print(add(10, 20, 30))    
print(add(10.5, 20.1))     
print(add("Hello", 20))    

# 2. Student Class
class Student:
    def __init__(self):
        self._student_id = None
        self._student_name = None
        self._city = None
        self._marks1 = 0
        self._marks2 = 0
        self._marks3 = 0
        self._fee_per_month = 0.0
        self._is_eligible_for_scholarship = False

    # Setters
    def set_student_id(self, student_id): self._student_id = student_id
    def set_student_name(self, student_name): self._student_name = student_name
    def set_city(self, city): self._city = city
    def set_marks1(self, marks1): self._marks1 = marks1
    def set_marks2(self, marks2): self._marks2 = marks2
    def set_marks3(self, marks3): self._marks3 = marks3
    def set_fee_per_month(self, fee): self._fee_per_month = fee
    def set_is_eligible_for_scholarship(self, eligible): self._is_eligible_for_scholarship = eligible

    # Getters
    def get_student_id(self): return self._student_id
    def get_student_name(self): return self._student_name
    def get_city(self): return self._city
    def get_marks1(self): return self._marks1
    def get_marks2(self): return self._marks2
    def get_marks3(self): return self._marks3
    def get_fee_per_month(self): return self._fee_per_month
    def get_is_eligible_for_scholarship(self): return self._is_eligible_for_scholarship

    def get_annual_fee(self):
        return self._fee_per_month * 12

    def get_total_marks(self):
        return self._marks1 + self._marks2 + self._marks3

    def get_average(self):
        return self.get_total_marks() / 3

    def get_result(self):
        if self._marks1 > 60 and self._marks2 > 60 and self._marks3 > 60:
            return "pass"
        else:
            return "fail"


students = []

s1 = Student()
s1.set_student_id(1)
s1.set_student_name("Alice")
s1.set_city("Delhi")
s1.set_marks1(80)
s1.set_marks2(90)
s1.set_marks3(85)
s1.set_fee_per_month(1500.0)
s1.set_is_eligible_for_scholarship(True)
students.append(s1)

s2 = Student()
s2.set_student_id(2)
s2.set_student_name("Bob")
s2.set_city("Mumbai")
s2.set_marks1(70)
s2.set_marks2(65)
s2.set_marks3(75)
s2.set_fee_per_month(1200.0)
s2.set_is_eligible_for_scholarship(False)
students.append(s2)

s3 = Student()
s3.set_student_id(3)
s3.set_student_name("Charlie")
s3.set_city("Chennai")
s3.set_marks1(60)
s3.set_marks2(55)
s3.set_marks3(65)
s3.set_fee_per_month(1800.0)
s3.set_is_eligible_for_scholarship(True)
students.append(s3)

highest = max(students, key=lambda s: s.get_total_marks())
print("Student with highest total marks:", highest.get_student_name())

lowest_fee = min(students, key=lambda s: s.get_fee_per_month())
print("Student with lowest fee:", lowest_fee.get_student_name(), lowest_fee.get_fee_per_month())


for s in students:
    print(f"Name: {s.get_student_name()}, Total Marks: {s.get_total_marks()}, Average: {s.get_average():.2f}, Result: {s.get_result()}, Scholarship: {s.get_is_eligible_for_scholarship()}")

# 3. Multiplication Table
def table_for(num):
    print("Multiplication Table using for loop:")
    for i in range(1, 11):
        print(f"{num} x {i} = {num*i}")

def table_while(num):
    print("Multiplication Table using while loop:")
    i = 1
    while i <= 10:
        print(f"{num} x {i} = {num*i}")
        i += 1

def table_do_while(num):
    print("Multiplication Table simulating do-while loop:")
    i = 1
    while True:
        print(f"{num} x {i} = {num*i}")
        i += 1
        if i > 10:
            break


table_for(2)
table_while(2)
table_do_while(2)

# 4. Word Count
def word_count(text):
    return len(text.split())

print("Word count:", word_count("Sum of 12 and 20 is 32"))
# 5. String Methods
text = "Hello World"
other = "hello world"
print("Indexing:", text[1])  
print("'World' in text:", 'World' in text) 
print("Length:", len(text)) 
print("Find 'World':", text.find('World')) 
print("Equality:", text == other) 
print("Case-insensitive equality:", text.lower() == other.lower()) 
print("Join:", '-'.join(['a', 'b', 'c'])) 
print("rfind 'l':", text.rfind('l')) 
print("Slicing [0:5]:", text[0:5])
print("Lower:", text.lower()) 
print("Upper:", text.upper()) 
print("Strip:", "  padded  ".strip())  

# 6. ArrayStore Class
class ArrayStore:
    def __init__(self):
        self.nums = []

    def accept(self, nums):
        if len(nums) != 10:
            raise ValueError("Exactly 10 integers required.")
        self.nums = nums.copy()

    def display_for(self):
        print("Display using for loop:")
        for n in self.nums:
            print(n, end=' ')
        print()

    def display_while(self):
        print("Display using while loop:")
        i = 0
        while i < len(self.nums):
            print(self.nums[i], end=' ')
            i += 1
        print()

    def sort(self):
        self.nums.sort()

    def count_occurrences(self, number):
        return self.nums.count(number)

    def insert_at(self, number, pos):
        if pos < 0 or pos > len(self.nums):
            raise IndexError("Position out of range.")
        self.nums.insert(pos, number)

    def unique_elements(self):
        return list(dict.fromkeys(self.nums))


arr = ArrayStore()
arr.accept([9, 2, 2, 9, 10, 9, 5, 6, 7, 8])
arr.display_for()
arr.display_while()
arr.sort()
print("Sorted:", arr.nums)
print("Count of 9:", arr.count_occurrences(9))
arr.insert_at(99, 3)
print("After insert:", arr.nums)
print("Unique elements:", arr.unique_elements())