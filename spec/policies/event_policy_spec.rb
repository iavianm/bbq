require 'rails_helper'

RSpec.describe EventPolicy, type: :policy do
  let(:user) { FactoryBot.create(:user) }
  let(:event_creator) { FactoryBot.create(:user) }

  let(:event) { FactoryBot.create(:event, user: event_creator) }

  subject { EventPolicy }

  context 'when the user watches the event' do
    context 'user is event creator' do
      permissions :show? do
        it 'give access to event' do
          expect(subject).to permit(event_creator, event)
        end
      end
    end

    context 'user is not event creator' do
      permissions :show? do
        it 'give access to event' do
          expect(subject).to permit(user, event)
        end
      end
    end

    context 'user is anon' do
      permissions :show? do
        it 'give access to event' do
          expect(subject).to permit(nil, event)
        end
      end
    end
  end

  context 'when user edit, update, delete event' do
    context 'user is event creator' do
      permissions :edit?, :update?, :destroy? do
        it 'give access to event' do
          expect(subject).to permit(event_creator, event)
        end
      end
    end

    context 'user is not event creator' do
      permissions :edit?, :update?, :destroy? do
        it 'not give access to event' do
          expect(subject).not_to permit(user, event)
        end
      end
    end

    context 'user is anon' do
      permissions :edit?, :update?, :destroy? do
        it 'not give access to event' do
          expect(subject).not_to permit(nil, event)
        end
      end
    end
  end
end
