class Createplant_params
  def initialize(plant_params, plant_id)
    @plant_params = plant_params
    @plant_id = plant_id
  end

  def call
    ActiveRecord::Base.transaction do
      create_stat!
      create_farm!
    end
  end

  private

  attr_reader :plant_params, :plant_id

  def create_plant_params!
    return Plant.update!(build_plant_params) if plant_id

    Plant.create!(build_plant_params)
  end

  def build_plant_params
    {
      id: plant_id,
      external_id: plant_params['id'],
      token_id: plant_params['tokenId'],
      owner_id: plant_params['ownerId'],
      plant_params_token_id: plant_params['plant_paramsokenId'],
      time_sell: Time.at(plant_params['timeSell']),
      starting_price: plant_params['startingPrice'],
      ending_price: plant_params['endingPrice'],
      duration: plant_params['duration'],
      status: plant_params['status'],
      external_updated_at: Time.at(plant_params['updatedAt']),
      icon_url: plant_params['iconUrl']
    }
  end

  def create_config!
    Config.create!(plant_params: create_plant_params!)
  end

  def config
    @config ||= create_config!
  end

  def create_farm!
    farm = plant_params['config']['farm']
    le = farm['le']
    hours = farm['hours']

    Farm.create!({
      le: le,
      hours: hours,
      le_rate: (le / hours),
      config: config
    })
  end

  def create_stat!
    stats = plant_params['config']['stats']

    Stat.create!({
      element: stats['type'],
      hp: stats['hp'],
      def_physics: stats['defPhysics'],
      def_magic: stats['defMagic'],
      damage_physics: stats['defMagic'],
      damage_magic: stats['damageMagic'],
      damage_pure: stats['damagePure'],
      damage_hp_loss: stats['damageHpLoss'],
      damage_hp_remove: stats['damageHpRemove'],
      config: config
    })
  end
end
