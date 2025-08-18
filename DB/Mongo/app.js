import express from 'express';
import mongoose from 'mongoose';
import mockSubscriptions from './data/mock.js';
import { DATABASE_URL } from './env.js';
import Subscription from './models/Subscription.js';

mongoose.connect(DATABASE_URL).then(() => console.log('Connected to DB'));

const app = express();
app.use(express.json());

function asyncHandler(handler) {
  async function asyncReqHandler(req, res) {
    try {
      await handler(req, res);
    } catch (e) {
      if (e.name === 'ValidationError') {
        res.status(400).send({ message: e.message });
      } else if (e.name === 'CastError') {
        res.status(404).send({ message: 'Cannot find given id.' });
      } else {
        res.status(500).send({ message: e.message });
      }
    }
  }
  
  return asyncReqHandler;
}

app.get('/subscriptions', asyncHandler(async (req, res) => {
  /** 쿼리 파라미터
   *  - sort: 'price'인 경우 높은 요금순, 그 외의 모든 경우 최신으로 생성된 순서
   */
  const sort = req.query.sort;
  const sortOption =
    sort === 'price' ? { price: 'desc' } : { createdAt: 'desc' };

  const subscriptions = await Subscription.find().sort(sortOption);
  res.send(subscriptions);
}));

app.get('/subscriptions/:id', asyncHandler(async (req, res) => {
  const subscription = await Subscription.findById(req.params.id);
  if (subscription) {
    res.send(subscription);
  } else {
    res.status(404).send({ message: 'Cannot find given id.' });
  }
}));

app.post('/subscriptions', asyncHandler(async (req, res) => {
  const newSubscription = await Subscription.create(req.body);
  res.status(201).send(newSubscription);
}));

app.patch('/subscriptions/:id', asyncHandler(async (req, res) => {
  const subscription = await Subscription.findById(req.params.id);
  if (subscription) {
    Object.keys(req.body).forEach((key) => {
      subscription[key] = req.body[key];
    });
    await subscription.save();
    res.send(subscription);
  } else {
    res.status(404).send({ message: 'Cannot find given id.' });
  }
}));

app.delete('/subscriptions/:id', asyncHandler(async (req, res) => {
  const id = Number(req.params.id);
  const subscription = await Subscription.findByIdAndDelete(id);
  if (subscription) {
    res.sendStatus(204);
  } else {
    res.status(404).send({ message: 'Cannot find given id.' });
  }
}));

app.listen(3000, () => console.log('Server Started'));
