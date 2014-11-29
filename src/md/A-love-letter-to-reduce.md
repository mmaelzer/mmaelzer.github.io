A love letter to reduce
===============

Oh `reduce`, how you are taken for granted, shoved into a corner, ignored for your more popular siblings `map` and `filter`. I see, though, that you can do the things that they can do. You can do what they do and *more*.

### Show off your map skills
```javascript
var array = [1, 2, 3, 4, 5];
var arrayDoubled = array.reduce(function double(arr, num) {
  return arr.concat(num * 2);
}, []);
console.log(arrayDoubled);
// [2, 4, 6, 8, 10]
```

### Show off your filter skills
```javascript
var array = [1, 2, 3, 4, 5];
var arrayEvens = array.reduce(function evensOnly(arr, num) {
  return num % 2 === 0 ? arr.concat(num) : arr;
}, []);
console.log(arrayEvens);
// [2, 4]
```

### Show off your object building skills
```javascript
var bob = {'firstName': 'Bob'};
var evans = {'lastName': 'Evans'};
var specialty = {'specialty': 'sausages'};

function extend() {
  var argsArray = Array.prototype.slice.apply(arguments);
  return argsArray.reduce(function(destObj, srcObj) {
    for (var key in srcObj) {
      destObj[key] = srcObj[key];
    }
    return destObj;
  }, {});
}

var bobEvans = extend(bob, evans, specialty);
console.log(bobEvans);
// { firstName: 'Bob', lastName: 'Evans', specialty: 'sausages' }
```