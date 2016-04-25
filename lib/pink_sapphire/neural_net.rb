module PinkSapphire
	class NeuralNet
    attr_reader :net, :activations
    attr_reader :input, :hidden, :output

    def initialize(input, hidden, output)
      @input = input
      @output = output
      @hidden = hidden
      @net = Array.new()
      @activations = Array.new()

      # Create weight matrix from input to first hiddent layer
      # Create activation vector for first layer
      @net << VectorMatrix.new(input.size, hidden.first, true)
      @activations << VectorMatrix.new(1, input.size, false)

      # Create weight matrices for connecting hidden layers
      for i in 0..hidden.size - 2
        @net << VectorMatrix.new(hidden[i], hidden[i + 1], true)
      end

      # Create activation vectors for hidden layers
      for i in 0..hidden.size - 1
        @activations << VectorMatrix.new(1, hidden[i], false)
      end

      # Create weight matrix from last hidden layer to output layer
      # Create activation vector for output layer
      @net << VectorMatrix.new(hidden.last, output.size, true)
      @activations << VectorMatrix.new(1, output.size, false)
    end

    def update(input_data_vector)
      raise ArgumentError, "Input data vector must be same size as input." if input_data_vector.size != @input.size

      # Set the initial activations equal to the input vector
      @input_data_vector_dub = Array.new
      @input_data_vector_dub << input_data_vector
      @activations[0].apply_array(@input_data_vector_dub)

      # Calculate the activiations of all other values within the network
      for i in 1..@activations.size - 1
        for j in 0..@activations[i].get_j_vector_size - 1
          sum = 0.0
          for k in 0..@activations[i - 1].get_j_vector_size - 1
            puts [j] << k << 97 if @activations[i - 1].get_value(0, k).nil?
            puts [j] << k << 96 if @net[i - 1].get_value(k, j).nil?
            #sum += @activations[i - 1].get_value(0, k) * @net[i - 1].get_value(k, j)
          end
          @activations[i].set_value(0, j, tanh_sigmoid(sum))
        end
      end

      # Return last activation vector
      @activations.last
    end

    private

    # Computes the sigmoid function
    def tanh_sigmoid(x)
      Math.tanh(x)
    end

    # Computes the derivative of the sigmoid
    def dx_tanh_sigmoid(x)
      1 - x ** 2 + (2 * x ** 4) / 4
    end
	end
end
