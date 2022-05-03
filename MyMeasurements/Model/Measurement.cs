namespace MyMeasurements.Model
{
    public class Measurement
    {
        public Guid Id { get; set; }
        public float Value { get; set; }
        public DateTime TimeStamp { get; set; }
        public Guid PersonId { get; set; }
        public string PersonName { get; set; }
        public Guid SensorId { get; set; }
        public string SensorName { get; set; }

        public Measurement()
        {
            Id = Guid.NewGuid();
        }
    }
}
