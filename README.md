# Oyster Card Challenge

**Makers Academy Week 2 Pairing Project using TDD**

![alt text](http://res.cloudinary.com/dani-devs-and-designs/image/upload/v1531923743/Oystercard_m1cage.jpg)

## 1. Set up project

Install gemfiles.

## 2. Set up RSpec

rspec -- init

## 3. Debug

**Type of error:**
```
NameError:
uninitialized constant Oystercard
```

**Error file path:**
```
./spec/oystercard_spec.rb
```

**Line number of error:**
`1`

**Meaning?**
We asked RSpec to look for a class (`Oystercard`) that doesn't exist yet.

**How to solve?**
Define class `Oystercard` in its own file.

## 4. Add the balance

**How will we interact with our code and manually test in irb (or pry)?**

Open irb in terminal and name a new instance of our `Oystercard` class:
`oystercard = Oystercard.new`

--------------------

**User Story:**  

```
In order to use public transport
As a customer
I want money on my card
```

**Feature:**  

Card has balance

## 5. Top up functionality

**User Story:**

```
In order to keep using public transport
As a customer
I want to add money to my card
```

**Feature:**  

Top-up card

-------------

**How will we interact with our code and manually test in irb (or pry)?**

- Open irb in terminal
- `require './lib/oystercard'`
- `card = Oystercard.new`
- `card.top_up(20)`

-------------

## 6. Enforce maximum balance

**User Story:**

```
In order to protect my money from theft or loss
As a customer
I want a maximum limit (of £90) on my card
```

**Feature:**  

Set max_limit to £90

-----------------

**How will we interact with our code and manually test in irb (or pry)?**

- Repeat previous steps
- Test .max_limit method

---------------

## 7. Deduct the money

**User Story:**

```
In order to pay for my journey
As a customer
I need my fare deducted from my card
```

**Feature:** 

card.deduct(amount)

--------------

## 8. Adding touch in/out 

```
In order to get through the barriers.
As a customer
I need to touch in and out.
```

**Features:** 

card.touch_in  
card.touch_out  
card.in_journey?

-----------------
 ## 9. Check minimum balance

 **User Story:**

 ```
 In order to pay for my journey
As a customer
I need to have the minimum amount (£1) for a single journey.
```

**Feature:**

card.minimum_balance

---------------------

## 10. Deduct money when touching out

**User Story:**

```
In order to pay for my journey
As a customer
When my journey is complete, I need the correct amount deducted from my card
```

**Feature:**

card.touch_out deduct(amount)

-------------------

## 11. Save the entry station

**User Story:**

```
In order to pay for my journey
As a customer
I need to know where I've travelled from
```

**Features:**

save entry station

---------------------

## 12. Add journey history


**User Story:**

```
In order to know where I have been
As a customer
I want to see all my previous trips
```

**Feature:**

save previous trips


-------------------

### Contributions:

@stephfash  
@kirtimansingh93  
@pliantmeerkat    
@tblanchard01
