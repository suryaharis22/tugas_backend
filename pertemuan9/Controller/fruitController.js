// Controller/fruitController.js
import fruits from '../Model/fruits.js';

const index = () => {
    for (const fruit of fruits) {
        console.log(fruit);
    }
};

const store = (data) => {
    fruits.push(data);
    index();
};

const update = (position, data) => {
    fruits[position] = data;
    index();
};

const destroy = (position) => {
    fruits.splice(position, 1);
    index();
};

export { index, store, update, destroy };
