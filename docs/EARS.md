# EARS - Easy Approach to Requirements Syntax

EARS (Easy Approach to Requirements Syntax) is a structured approach to writing clear, unambiguous requirements using constrained natural language patterns.

## Five EARS Requirement Types

### 1. Ubiquitous Requirements (No keyword)

Always active requirements.

**Structure:** `The <system name> shall <system response>`

**Examples:**
- "The mobile phone shall have a mass of less than 150 grams."
- "The system shall support up to 1000 concurrent users."

### 2. State-Driven Requirements (While)

Active during a specified state.

**Structure:** `While <precondition(s)>, the <system name> shall <system response>`

**Examples:**
- "While there is no card in the ATM, the ATM shall display 'insert card to begin'."
- "While the engine is running, the vehicle shall display the coolant temperature."

### 3. Event-Driven Requirements (When)

Triggered by an event.

**Structure:** `When <trigger>, the <system name> shall <system response>`

**Examples:**
- "When 'mute' is selected, the laptop shall suppress all audio output."
- "When the user presses the power button, the system shall initiate the shutdown sequence."

### 4. Optional Feature Requirements (Where)

Apply when optional feature exists.

**Structure:** `Where <feature is included>, the <system name> shall <system response>`

**Examples:**
- "Where the car has a sunroof, the car shall have a sunroof control panel on the driver door."
- "Where Bluetooth is supported, the device shall allow pairing with up to 5 devices."

### 5. Unwanted Behaviour Requirements (If...Then)

Handle errors or exceptional situations.

**Structure:** `If <trigger>, then the <system name> shall <system response>`

**Examples:**
- "If an invalid credit card number is entered, then the website shall display 'please re-enter credit card details'."
- "If the temperature sensor fails, then the system shall activate the emergency cooling protocol."

## Best Practices

1. **Keep it simple** - Use the appropriate EARS pattern for each requirement type
2. **Be consistent** - Maintain standard structure across all requirements
3. **Use precise language** - Avoid vague terms like "should," "adequate," "appropriate"
4. **Make it testable** - Ensure each requirement can be verified
5. **Use the right pattern** - Choose the EARS type that best fits the requirement's nature

## Common Mistakes to Avoid

- Using multiple EARS keywords in a single requirement (keep requirements atomic)
- Overcomplicating pre-conditions or triggers
- Writing requirements that cannot be tested
- Mixing different requirement types in one statement
- Using ambiguous system names or responses

## Quick Reference

| Type | Keyword | Use When |
|------|---------|----------|
| Ubiquitous | None | Requirement always applies |
| State-Driven | While | Requirement applies during a specific state |
| Event-Driven | When | Requirement triggers on an event |
| Optional Feature | Where | Requirement applies if feature exists |
| Unwanted Behaviour | If...Then | Requirement handles error/exception cases |
