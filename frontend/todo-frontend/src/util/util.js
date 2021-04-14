export const delay = (time, value = '') =>
  new Promise((resolve) => setTimeout(() => resolve(value), time));
