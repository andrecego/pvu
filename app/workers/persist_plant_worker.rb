class PersistPlantWorker
  include Sidekiq::Worker

  def perform(plant_params)
    plant = Plant.find_by(external_id: plant_params['id'])

    return if skip_upsert?(plant_params, plant)
    CreatePlant.new(plant_params, plant.id).call
  end

  private

  def skip_upsert?(plant_params, plant)
    return false unless plant

    plant.external_updated_at >= Time.at(plant_params['updatedAt'])
  end
end
