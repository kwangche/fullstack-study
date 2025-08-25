import mongoose from 'mongoose';
import { DATABASE_URL } from '../env.js';
import data from './mock.js';
import Subscription from '../models/Subscription.js';

mongoose.connect(DATABASE_URL);

await Subscription.deleteMany({});
await Subscription.insertMany(data);

mongoose.connection.close();
