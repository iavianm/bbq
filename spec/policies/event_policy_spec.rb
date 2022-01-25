require 'rails_helper'

RSpec.describe EventPolicy, type: :policy do
  let(:user) { FactoryBot.create(:user) }
  let(:event_creator) { FactoryBot.create(:user) }

  let(:event) { FactoryBot.create(:event, user: event_creator) }
  let(:secure_event) { FactoryBot.create(:event, user: event_creator, pincode: '000') }

  let(:event_creator_access) { PunditUser.new(event_creator, {}) }
  let(:user_with_access) { PunditUser.new(user, cookies) }
  let(:user_without_access) { PunditUser.new(user, {}) }
  let(:anon_with_access) { PunditUser.new(nil, cookies) }
  let(:anon_without_access) { PunditUser.new(nil, {}) }

  let(:cookies) { { "events_#{secure_event.id}_pincode" => '000' } }

  subject { EventPolicy }

  describe 'when the user watches the event' do
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

  describe 'when the user watches the secure_event' do
    context 'user is event creator' do
      permissions :show? do
        it 'give access to event' do
          expect(subject).to permit(event_creator_access, secure_event)
        end
      end
    end

    context 'user without access' do
      permissions :show? do
        it 'give access to event' do
          expect(subject).not_to permit(user_without_access, secure_event)
        end
      end
    end

    context 'user with access' do
      permissions :show? do
        it 'give access to event' do
          expect(subject).to permit(user_with_access, secure_event)
        end
      end
    end

    context 'anon without access' do
      permissions :show? do
        it 'give access to event' do
          expect(subject).not_to permit(anon_without_access, secure_event)
        end
      end
    end

    context 'anon with access' do
      permissions :show? do
        it 'give access to event' do
          expect(subject).to permit(anon_with_access, secure_event)
        end
      end
    end
  end

  describe 'when user edit, update, delete event' do
    context 'user is event creator' do
      permissions :edit?, :update?, :destroy? do
        it 'give access to event' do
          expect(subject).to permit(event_creator_access, secure_event)
        end
      end
    end

    context 'user is not event creator' do
      permissions :edit?, :update?, :destroy? do
        it 'not give access to event' do
          expect(subject).not_to permit(user_with_access, secure_event)
        end
      end
    end

    context 'user is anon' do
      permissions :edit?, :update?, :destroy? do
        it 'not give access to event' do
          expect(subject).not_to permit(anon_with_access, secure_event)
        end
      end
    end
  end
end
