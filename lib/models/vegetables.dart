const String WEIGHTED = 'weighted';
const String WEIGHTS = 'weights';
const String MIN_WEIGHT = 'min-weight';
const String MAX_WEIGHT = 'max-weight';
const String IMAGE_PATH = 'assets/images/vegetables/';
const List WEIGHT1 = [0.5, 1, 5];
const List WEIGHT2 = [0.25, 0.5, 1];

const Map<String, Map<String, dynamic>> Vegetables = {
  'Onion': {
    WEIGHTED: true,
    WEIGHTS: WEIGHT1,
    IMAGE_PATH: IMAGE_PATH + '',
  },
  'Tomato': {
    WEIGHTED: true,
    WEIGHTS: WEIGHT1,
    IMAGE_PATH: IMAGE_PATH + '',
  },
  'Potato': {
    WEIGHTED: true,
    WEIGHTS: WEIGHT1,
    IMAGE_PATH: IMAGE_PATH + '',
  },
  'Lemon': {
    WEIGHTED: true,
    WEIGHTS: WEIGHT2,
    IMAGE_PATH: IMAGE_PATH + '',
  },
  'Lady Finger [Bhindi]': {
    WEIGHTED: true,
    WEIGHTS: WEIGHT1,
    IMAGE_PATH: IMAGE_PATH + '',
  },
  'Cucumber': {
    WEIGHTED: true,
    WEIGHTS: WEIGHT1,
    IMAGE_PATH: IMAGE_PATH + '',
  },
  'Bottle Gourd': {
    WEIGHTED: false,
    MIN_WEIGHT: 0.6,
    MAX_WEIGHT: 0.9,
    IMAGE_PATH: IMAGE_PATH + '',
  },
  'Ginger': {
    WEIGHTED: true,
    WEIGHTS: WEIGHT2,
    IMAGE_PATH: IMAGE_PATH + '',
  },
  'Brinjal': {
    WEIGHTED: true,
    WEIGHTS: WEIGHT1,
    IMAGE_PATH: IMAGE_PATH + '',
  },
  'Green Brinjal': {
    WEIGHTED: true,
    WEIGHTS: WEIGHT1,
    IMAGE_PATH: IMAGE_PATH + '',
  },
  'Green Chilli': {
    WEIGHTED: true,
    WEIGHTS: WEIGHT2,
    IMAGE_PATH: IMAGE_PATH + '',
  },
  'Cabbage': {
    WEIGHTED: false,
    MIN_WEIGHT: 0.5,
    MAX_WEIGHT: 0.8,
    IMAGE_PATH: IMAGE_PATH + '',
  },
  'Garlic': {
    WEIGHTED: true,
    WEIGHTS: WEIGHT2,
    IMAGE_PATH: IMAGE_PATH + '',
  },
  'French beans': {
    WEIGHTED: true,
    WEIGHTS: WEIGHT1,
    IMAGE_PATH: IMAGE_PATH + '',
  },
  'Broad beans': {
    WEIGHTED: true,
    WEIGHTS: WEIGHT1,
    IMAGE_PATH: IMAGE_PATH + '',
  },
  'Beetroot': {
    WEIGHTED: true,
    WEIGHTS: WEIGHT1,
    IMAGE_PATH: IMAGE_PATH + '',
  },
  'Snake Gourd': {
    WEIGHTED: true,
    WEIGHTS: WEIGHT1,
    IMAGE_PATH: IMAGE_PATH + '',
  },
  'Pumpkin': {
    WEIGHTED: false,
    MIN_WEIGHT: 1,
    MAX_WEIGHT: 1,
    IMAGE_PATH: IMAGE_PATH + '',
  },
  'Cluster beans': {
    WEIGHTED: true,
    WEIGHTS: WEIGHT1,
    IMAGE_PATH: IMAGE_PATH + '',
  },
  'Cauliflower': {
    WEIGHTED: false,
    MIN_WEIGHT: 0.4,
    MAX_WEIGHT: 0.6,
    IMAGE_PATH: IMAGE_PATH + '',
  },
  'Mushroom': {
    WEIGHTED: true,
    WEIGHTS: WEIGHT2,
    IMAGE_PATH: IMAGE_PATH + '',
  },
  'Ridge Gourd': {
    WEIGHTED: true,
    WEIGHTS: WEIGHT1,
    IMAGE_PATH: IMAGE_PATH + '',
  },
  'Bitter Gourd': {
    WEIGHTED: true,
    WEIGHTS: WEIGHT1,
    IMAGE_PATH: IMAGE_PATH + '',
  },
  'Spring Onion': {
    WEIGHTED: true,
    WEIGHTS: WEIGHT2,
    IMAGE_PATH: IMAGE_PATH + '',
  },
  'Broccoli': {
    WEIGHTED: true,
    WEIGHTS: WEIGHT2,
    IMAGE_PATH: IMAGE_PATH + '',
  },
  'Capsicum': {
    WEIGHTED: true,
    WEIGHTS: WEIGHT1,
    IMAGE_PATH: IMAGE_PATH + '',
  },
  'Radish': {
    WEIGHTED: true,
    WEIGHTS: WEIGHT1,
    IMAGE_PATH: IMAGE_PATH + '',
  },
  'Tamarind': {
    WEIGHTED: true,
    WEIGHTS: WEIGHT2,
    IMAGE_PATH: IMAGE_PATH + '',
  },
  'Coriander': {
    WEIGHTED: true,
    WEIGHTS: WEIGHT2,
    IMAGE_PATH: IMAGE_PATH + '',
  },
  'Spinach': {
    WEIGHTED: true,
    WEIGHTS: WEIGHT2,
    IMAGE_PATH: IMAGE_PATH + '',
  },
  'Mint Leaves [Pudina]': {
    WEIGHTED: true,
    WEIGHTS: WEIGHT2,
    IMAGE_PATH: IMAGE_PATH + '',
  },
  'Fenugreek [Methi]': {
    WEIGHTED: true,
    WEIGHTS: WEIGHT2,
    IMAGE_PATH: IMAGE_PATH + '',
  },
};