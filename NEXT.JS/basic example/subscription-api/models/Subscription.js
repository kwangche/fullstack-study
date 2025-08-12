import mongoose from 'mongoose';

const SubscriptionSchema = new mongoose.Schema(
  {
    name: {
      type: String,
      required: true,
      maxLength: 20,
    },
    price: {
      type: Number,
      required: true,
      min: 0,
    },
    cycle: {
      type: String,
      required: true,
      enum: ['m', 'y'],
    },
    firstPaymentDate: {
      type: Date,
      required: true,
    },
    memo: {
      type: String,
    },
  },
  {
    timestamps: true,
  }
);

const Subscription = mongoose.model('Subscription', SubscriptionSchema);

export default Subscription;
