public class AsteroidDataField<T> {
	private String fieldName;
	private T fieldValue;
	private String units;

	AsteroidDataField(String _fieldName, T _fieldValue) {
		fieldName = _fieldName;
		fieldValue = _fieldValue;
	}

	AsteroidDataField(String _fieldName, T _fieldValue, String _units) {
		fieldName = _fieldName;
		fieldValue = _fieldValue;
		units = _units;
	}

	public String getName() {
		return fieldName;
	}

	public T getValue() {
		return fieldValue;
	}

	public String getUnitsSuffix() {
		return units;
	}

	public String toString() {
		String output;
		if (units != null) {
			output = fieldValue.toString() + " " + units;
		} else {
			output = fieldValue.toString();
		}
		return output;
	}
}
