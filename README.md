# Oyster Card Challenge

**Makers Academy Week 2 Pairing Challenge**

## 1. Set up project

## 2. Set up RSpec

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

```
In order to pay for my journey
As a customer
I need my fare deducted from my card
```

**Feature:** 

card.deduct(amount)

--------------

## 8. 











