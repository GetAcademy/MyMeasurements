using System.Data.SqlClient;
using Dapper;
using MyMeasurements.Model;

var builder = WebApplication.CreateBuilder(args);
const string connStr = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=TestDb;Integrated Security=True";
var app = builder.Build();
app.MapGet("/measurement", async () =>
{
    var conn = new SqlConnection(connStr);
    const string sql = @"
        SELECT m.Id, 
	        m.Value,
	        m.TimeStamp,
            m.PersonId,
	        p.Name as PersonName,
            m.SensorId,
	        s.Name as SensorName
        FROM Measurement m
        JOIN Person p on m.PersonId = p.Id
        JOIN Sensor s on m.SensorId = s.Id
        ";
    var measurements = await conn.QueryAsync<Measurement>(sql);
    return measurements;
});
app.MapGet("/measurement/{id}", async (Guid id) =>
{
    var conn = new SqlConnection(connStr);
    const string sql = @"
        SELECT m.Id, 
	        m.Value,
	        m.TimeStamp,
	        p.Name as PersonName,
            m.PersonId,
	        s.Name as SensorName,
            m.SensorId
        FROM Measurement m
        JOIN Person p on m.PersonId = p.Id
        JOIN Sensor s on m.SensorId = s.Id
        WHERE m.Id = @Id
        ";
    var measurements = await conn.QueryAsync<Measurement>(sql, new { Id = id });
    return measurements.SingleOrDefault();
});
app.MapDelete("/measurement/{id}", async (Guid id) =>
{
    var conn = new SqlConnection(connStr);
    const string sql = @"DELETE FROM Measurement WHERE Id = @Id";
    var rowsAffected = await conn.ExecuteAsync(sql, new { Id = id });
    return rowsAffected;
});
app.MapPost("/measurement", async (Measurement measurement) =>
{
    var conn = new SqlConnection(connStr);
    const string sql = @"INSERT INTO Measurement VALUES (@Id, @Value, @TimeStamp, @PersonId, @SensorId)";
    var rowsAffected = await conn.ExecuteAsync(sql, measurement);
    return rowsAffected;
});

app.MapPut("/measurement", async (Measurement measurement) =>
{
    var conn = new SqlConnection(connStr);
    const string sql = @"UPDATE Measurement 
                         SET Value=@Value, PersonId=@PersonId, SensorId=@SensorId, TimeStamp=@TimeStamp
                         WHERE Id=@Id";
    var rowsAffected = await conn.ExecuteAsync(sql, measurement);
    return rowsAffected;
});

app.MapGet("/person", async () =>
{
    var conn = new SqlConnection(connStr);
    const string sql = @"SELECT * FROM Person";
    var people = await conn.QueryAsync<Person>(sql);
    return people;
});

app.MapGet("/sensor", async () =>
{
    var conn = new SqlConnection(connStr);
    const string sql = @"SELECT * FROM Sensor";
    var sensors = await conn.QueryAsync<Sensor>(sql);
    return sensors;
});

app.UseStaticFiles();
app.Run();
