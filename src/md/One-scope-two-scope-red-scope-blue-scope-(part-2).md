One scope two scope red scope blue scope (part 2)
=================================================

> Think left and think right  
> and think low and think high.  
> Oh, the thinks you can think up  
> if only you try!

Here we are again, talking about JavaScript scoping. [Last time](One-scope-two-scope-red-scope-blue-scope.html) we spoke of how `this` works: `this` refers to the object that's calling the function, like so:

```javascript
var dog = {
  noise: 'bark',
  speak: function() {
    console.log(this.noise);
  }
};

dog.speak();
// bark
```

  
## Function.prototype.call

Let's look at how we can override the default behavior of `this` by using the [call](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/call) method on a `function`.

```javascript
var dog = {
  noise: 'bark',
  speak: function() {
    console.log(this.noise);
  }
};

var cat = {
  noise: 'meow'
};

dog.speak.call(cat);
// meow
```

The [call](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/call) method also allows us to provide arguments to a function being called.
```javascript
var dog = {
  name: 'dog',
  eat: function(food) {
    console.log('the', this.name, 'eats', food);
  }
};

var cat = {
  name: 'cat'
};

dog.eat('treats');
// the dog eats treats

dog.eat.call(cat, 'fish');
// the cat eats fish
```
  

## Function.prototype.apply

The [apply](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/apply) method is just like the [call](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/call) method _except_ it takes an array of arguments instead of a series of arguments. Let me illustrate.

```javascript
var sum = function(num1, num2, num3) {
  return this.startingValue + num1 + num2 + num3;
};

var callValue = sum.call({ startingValue: 0 }, 1, 2, 3);
console.log(callValue);
// 6

var applyValue = sum.apply({ startingValue: 0 }, [1, 2, 3]);
console.log(applyValue);
// 6
```

That's it. The [call](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/call) and [apply](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/apply) methods are super useful ways of overriding the default behavior of `this`.
