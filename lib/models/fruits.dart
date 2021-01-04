const String WEIGHTED = 'weighted';
const String WEIGHTS = 'weights';
const String MIN_WEIGHT = 'min-weight';
const String MAX_WEIGHT = 'max-weight';
const String IMAGE_PATH = 'assets/images/fruits/';
const List WEIGHT1 = [0.5, 1, 5];
const List WEIGHT2 = [0.25, 0.5, 1];

const Map<String, Map<String, dynamic>> Fruits = {
  'Apple': {
    WEIGHTED: true,
    WEIGHTS: WEIGHT1,
    IMAGE_PATH: IMAGE_PATH + '',
  },
  'Mango': {
    WEIGHTED: true,
    WEIGHTS: WEIGHT1,
    IMAGE_PATH: IMAGE_PATH + '',
  },
  'Banana': {
    WEIGHTED: true,
    WEIGHTS: WEIGHT1,
    IMAGE_PATH: IMAGE_PATH + '',
  },
  'Raw Banana': {
    WEIGHTED: true,
    WEIGHTS: WEIGHT1,
    IMAGE_PATH: IMAGE_PATH + '',
  },
  'Papaya': {
    WEIGHTED: false,
    MIN_WEIGHT: 0.7,
    MAX_WEIGHT: 1,
    IMAGE_PATH: IMAGE_PATH + '',
  },
  'Brown Coconut': {
    WEIGHTED: false,
    MIN_WEIGHT: 0.4,
    MAX_WEIGHT: 0.8,
    IMAGE_PATH: IMAGE_PATH + '',
  },
  'Sweet Lime [Mosambi]': {
    WEIGHTED: true,
    WEIGHTS: WEIGHT1,
    IMAGE_PATH: IMAGE_PATH + '',
  },
  'Pomegranate': {
    WEIGHTED: true,
    WEIGHTS: WEIGHT1,
    IMAGE_PATH: IMAGE_PATH + '',
  },
  'Watermelon': {
    WEIGHTED: false,
    MIN_WEIGHT: 1.25,
    MAX_WEIGHT: 2.25,
    IMAGE_PATH: IMAGE_PATH + '',
  },
  'Kiwi': {
    WEIGHTED: true,
    WEIGHTS: WEIGHT1,
    IMAGE_PATH: IMAGE_PATH + '',
  },
  'Pineapple': {
    WEIGHTED: false,
    MIN_WEIGHT: 0.8,
    MAX_WEIGHT: 1.2,
    IMAGE_PATH: IMAGE_PATH + '',
  },
  'Avocado': {
    WEIGHTED: true,
    WEIGHTS: WEIGHT1,
    IMAGE_PATH: IMAGE_PATH + '',
  },
  'Muskmelon': {
    WEIGHTED: false,
    MIN_WEIGHT: 0.6,
    MAX_WEIGHT: 1,
    IMAGE_PATH: IMAGE_PATH + '',
  },
  'Custard Apple': {
    WEIGHTED: true,
    WEIGHTS: WEIGHT1,
    IMAGE_PATH: IMAGE_PATH + '',
  },
  'Gooseberry [Amla]': {
    WEIGHTED: true,
    WEIGHTS: WEIGHT2,
    IMAGE_PATH: IMAGE_PATH + '',
  },
  'Plums': {
    WEIGHTED: true,
    WEIGHTS: WEIGHT2,
    IMAGE_PATH: IMAGE_PATH + '',
  },
  'Pear': {
    WEIGHTED: true,
    WEIGHTS: WEIGHT1,
    IMAGE_PATH: IMAGE_PATH + '',
  },
  'Sapota [Chickoo]': {
    WEIGHTED: true,
    WEIGHTS: WEIGHT1,
    IMAGE_PATH: IMAGE_PATH + '',
  },
  'Orange': {
    WEIGHTED: true,
    WEIGHTS: WEIGHT1,
    IMAGE_PATH: IMAGE_PATH + '',
  },
  'Gauva': {
    WEIGHTED: true,
    WEIGHTS: WEIGHT1,
    IMAGE_PATH: IMAGE_PATH + '',
  },
};