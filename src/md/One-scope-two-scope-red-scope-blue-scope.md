One scope two scope red scope blue scope
=========================================

> From there to here,  
> from here to there,  
> Funny things  
> Are everywhere.  

Poke around the intertube, and you'll find an endless stream of questions around JavaScript scoping. There's no need for the confusion, scoping in JavaScript is super duper easy if you put aside whatever scoping you're accustomed to.  
  
Here's the trick, by default, `this` refers to the `object` that's calling the function. `this` has nothing to do with `if` blocks or `for` loops or `switch` statements. The keyword `this` is always scoped by function [except for one case that you should never ever even consider](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/with).  

## One scope
```javascript
function scope() {
  console.log(this.name);
}

scope();
//> undefined

this.name = "one scope";
scope();
//> one scope
```

## Two scope
```javascript
function scope() {
  console.log(this.name);
}

var two = {
  name: "two scope"
};

scope();
//> undefined

two.scope = scope;
two.scope();
//> two scope
```

## Red scope
```javascript
function scope() {
  console.log(this.name);
}

function Red() {
  this.name = 'red scope';
}

var red = new Red();
red.scope = scope;
red.scope();
//> red scope
```

## Blue scope
```javascript
function scope() {
  console.log(this.name);
}

function Blue() {
  this.name = 'blue scope';
}

Blue.prototype.scope = scope;

var blue = new Blue();
blue.scope();
//> blue scope

blue.name = "true blue scope";
blue.scope();
//> true blue scope
```

In the next post, I'll talk about overriding the default scoping behavior with [Function.prototype.call](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/call) and [Function.prototype.apply](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/apply).